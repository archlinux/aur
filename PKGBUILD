# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=wayweather
pkgver=2.0.1
pkgrel=1
pkgdesc="Custom Weather Script for Waybar with IP Geolocation"
arch=('any')
url="https://github.com/TheElevatedOne/wayweather"
license=('GPL3')
depends=('tombl-bin' 'gawk' 'curl' 'jq' 'bash')
options=('!debug' '!strip')
provides=(wayweather)
source=("git+https://github.com/TheElevatedOne/wayweather.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd wayweather
  git describe --abbrev=0
  cd ..
}

package() {
  set -e
  cd wayweather

  # Install Main Executable
  install -Dm755 wayweather "${pkgdir}/usr/bin/wayweather"

  # Install Libraries
  install -Dm755 src/config.sh "${pkgdir}/usr/lib/${pkgname}/config.sh"
  install -Dm755 src/locations.sh "${pkgdir}/usr/lib/${pkgname}/locations.sh"
  install -Dm755 src/meteo_api.sh "${pkgdir}/usr/lib/${pkgname}/meteo_api.sh"
  install -Dm755 src/output.sh "${pkgdir}/usr/lib/${pkgname}/output.sh"
  install -Dm755 src/version "${pkgdir}/usr/lib/${pkgname}/version"

  # Export License
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
