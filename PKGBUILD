# Maintainer: Amish <contact at via dot aur>
pkgname=pam_geoip
pkgver=1.1
pkgrel=1
pkgdesc='A Pluggable Authentication Module (PAM) for GeoIP based access'
arch=(i686 x86_64)
url='http://ankh-morp.org/code/pam_geoip/'
license=('GPL' 'LGPL')
depends=('geoip' 'geoip-database' 'geoip-database-extra')
source=("http://download.ankh-morp.org/pam_geoip/${pkgname}-${pkgver}.tar.gz"
        'geoip.diff')
md5sums=('072709760bbb4557d1cc166072bca5da'
         '9de2649ce73f2296a73cc4ecb614c555')
backup=('etc/security/geoip.conf')

prepare() {
  cd "${srcdir}"
  patch -p0 < geoip.diff
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 755 pam_geoip.so "${pkgdir}"/usr/lib/security/pam_geoip.so
  install -D -m 644 geoip.default.conf "${pkgdir}"/etc/security/geoip.conf
  install -D -m 644 geoip.conf.5 "${pkgdir}"/usr/share/man/man5/geoip.conf.5
  install -D -m 644 pam_geoip.8 "${pkgdir}"/usr/share/man/man8/pam_geoip.8
}
