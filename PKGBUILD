# Maintainer: Amish <contact at via dot aur>
pkgname=pam_geoip
pkgver=2.1.1
pkgrel=1
pkgdesc='A Pluggable Authentication Module (PAM) for GeoIP based access'
arch=('i686' 'x86_64')
url="https://github.com/amishmm/pam_geoip"
license=('LGPL')
depends=('geoip2-database' 'libmaxminddb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('33667872f8fa6080011e762c165f5421')
backup=('etc/security/geoip.conf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 755 pam_geoip.so "${pkgdir}"/usr/lib/security/pam_geoip.so
  install -D -m 644 geoip.conf "${pkgdir}"/etc/security/geoip.conf
  install -D -m 644 geoip.conf.5 "${pkgdir}"/usr/share/man/man5/geoip.conf.5
  install -D -m 644 pam_geoip.8 "${pkgdir}"/usr/share/man/man8/pam_geoip.8
}
