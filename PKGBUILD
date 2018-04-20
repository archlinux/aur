# Maintainer: Deon Spengler <deon at spengler dot co dot za>

pkgname=openldap-ppm
_pkgname=ppm
pkgver=1.7
ldapver=2.4.46
pkgrel=1
pkgdesc="An OpenLDAP module for checking password quality"
arch=('x86_64')
url="https://ltb-project.org"
license=('OpenLDAP Public License')
options=('!makeflags')
depends=('libldap')
source=(https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${ldapver}.tgz
        https://ltb-project.org/archives/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('9a90dcb86b99ae790ccab93b7585a31fbcbeec8c94bf0f7ab0ca0a87ea0c4b2d'
            'b359e0a29a34d936fbbcfd2b3e85ff4639b4d3551bf7e9786a67b82af7537ef9')

prepare() {
  mv ${_pkgname}-${pkgver} openldap-${ldapver}/contrib/slapd-modules/ppm
}

build() {
  cd openldap-${ldapver}
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --sbindir=/usr/bin
  make depend
  cd contrib/slapd-modules/ppm/
  make
}

package() {
  install -Dm644 "${srcdir}"/openldap-${ldapver}/contrib/slapd-modules/ppm/ppm.so "${pkgdir}"/usr/lib/openldap/ppm.so
  install -Dm644 "${srcdir}"/openldap-${ldapver}/contrib/slapd-modules/ppm/ppm.conf "${pkgdir}"/etc/openldap/ppm.conf
}
