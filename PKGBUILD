# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=UbuntuIndicatorWeather
pkgname=simple-weather-indicator
pkgver=2.0
pkgrel=1
pkgdesc='A simple weather indicator'
arch=('any')
url='https://github.com/Phoenix09/UbuntuIndicatorWeather'
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'python-retrying' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phoenix09/UbuntuIndicatorWeather/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c264f4cf0727e81619e98e4534720e5698c32a928143b5b235ba15a0b0ea7853')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Don't install to ubuntu- directory
  find . -type f -exec sed -i 's:ubuntu-indicator-weather:simple-weather-indicator:g' '{}' \;
}

package() {
  cd "${_pkgname}-${pkgver}"
  while read file dest ; do
    [ ! -d "${pkgdir}/${dest}" ] && mkdir -p "${pkgdir}/${dest}"
    install -m644 "${file}" "${pkgdir}/${dest}"
  done < debian/install
  chmod 755 "${pkgdir}"/usr/lib/simple-weather-indicator/indicator-weather
  mkdir -p "${pkgdir}"/usr/bin
  ln -s /usr/lib/simple-weather-indicator/indicator-weather "${pkgdir}"/usr/bin/indicator-weather
}
