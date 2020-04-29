import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const api_key = 'f3a08f6257f9de89906532aa89b4ebd9';

class WeatherModel {
  Future getLocalWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?"
        "lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric");
    return await networkHelper.getData();
  }

  Future getWeatherByCityName(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper("http://api.openweathermap.org/data/2.5/weather?"
            "q=$cityName&appid=$api_key&units=metric");
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
