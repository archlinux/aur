# Maintainer: Marcel Rupp <comfix@comfix.cc>
pkgname=openldap-mod-argon2
pkgver=2.4.56
pkgrel=1
pkgdesc='OpenLDAP slap.d pw-argon2 module'
arch=('x86_64')
url='https://www.openldap.org'
license=('OpenLDAP Public License')
depends=('openldap' 'argon2' 'libsodium')
source=("https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz")
sha256sums=('25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0')

prepare () {
  cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/passwd/argon2"

  echo  ${srcdir}/../0001-argon2-makefile.patch
  patch -Np1 < ${srcdir}/../0001-argon2-makefile.patch
}

build() {
  cd "${srcdir}/openldap-${pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make

  cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/passwd/argon2"
  make
}

package() {
  cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/passwd/argon2"
  DESTDIR=${pkgdir} make install
}
