# Maintainer: Deon Spengler <deon at spengler dot co dot za>

pkgname=openldap-ppm
_pkgname=ppm
pkgver=2.2
_ldapver=2.6.10
pkgrel=2
pkgdesc="An OpenLDAP module for checking password quality"
arch=('x86_64')
url="https://ltb-project.org"
license=('OpenLDAP Public License')
options=('!makeflags')
depends=('libldap')
source=(https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${_ldapver}.tgz
        https://github.com/ltb-project/ppm/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c065f04aad42737aebd60b2fe4939704ac844266bc0aeaa1609f0cad987be516'
            'f2bb346072d1ce9a57f5351f32d2b640edd0cecb30d298ea150b4da16650431a')

prepare() {
  mv ${_pkgname}-${pkgver} openldap-${_ldapver}/contrib/slapd-modules/ppm
}

build() {
  cd openldap-${_ldapver}
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --sbindir=/usr/bin
  make depend
  cd contrib/slapd-modules/ppm/
  make
}

package() {
  install -Dm644 "${srcdir}"/openldap-${_ldapver}/contrib/slapd-modules/ppm/ppm.so "${pkgdir}"/usr/lib/openldap/ppm.so
  install -Dm644 "${srcdir}"/openldap-${_ldapver}/contrib/slapd-modules/ppm/ppm.example "${pkgdir}"/etc/openldap/ppm.conf
}
