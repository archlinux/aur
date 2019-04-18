# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=varken
pkgver=1.6.7
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/varken"
license=('GPL3')
depends=('python'
         'grafana'
         'influxdb'
         'python-requests'
         'python-geoip2'
         'python-influxdb'
         'python-schedule'
         'python-distro'
         'python-urllib3')

source=("varken-${pkgver}.tar.gz::https://github.com/Boerderij/Varken/archive/${pkgver}.tar.gz"
        'varken.service'
        'varken.sysusers'
        'varken.tmpfiles')

sha256sums=('1240cfcf89e2da5aa8c9ca3ba2b170467c5f89f5dc411afa9685f38bcb8d40c8'
            'f84a734ea7a7bc29a6d789ed7251fc7285c401bad09446152f965fd7b483c9ae'
            'ba43aebc95499e93a03d7abf1e1671d72d734725e8a0f2c35ccce3f5ec9b72e2'
            '75805db8a147673b0b3ea11fe46cc9e8b96b76e7877bc17878d4fc6d57ae014c')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/varken"
  install -d -m 755 "${pkgdir}/var/lib/varken"

  cp -dpr --no-preserve=ownership "${srcdir}/Varken-${pkgver}/data/varken.example.ini" "${pkgdir}/var/lib/varken"
  cp -dpr --no-preserve=ownership "${srcdir}/Varken-${pkgver}/"* "${pkgdir}/usr/lib/varken"

  install -D -m 644 "${srcdir}/varken.service" "${pkgdir}/usr/lib/systemd/system/varken.service"
  install -D -m 644 "${srcdir}/varken.sysusers" "${pkgdir}/usr/lib/sysusers.d/varken.conf"
  install -D -m 644 "${srcdir}/varken.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/varken.conf"
}
