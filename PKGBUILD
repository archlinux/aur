# Maintainer: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope2
pkgver=2.3.3a
pkgrel=2
pkgdesc="application server used by SOGo"
arch=('i686' 'x86_64')
url="http://www.sogo.nu/files/downloads/SOGo/Sources/"
license=('GPL')
depends=('gnustep-base')
makedepends=('gcc-objc' 'libxml2' 'libmariadbclient' 'libldap' 'openssl' 'postgresql-libs')
optdepends=('libxml2: parse XML coniguration files'
            'mariadb: run database server for sogo locally'
            'openldap: run directory server for sogo locally'
            'openssl: create SSL secured connectons'
            'postgresql: run database server for sogo locally')
options=('!strip')
source=("http://www.sogo.nu/files/downloads/SOGo/Sources/SOPE-${pkgver}.tar.gz"
        "sope_configure.patch")

prepare() {
  cd "${srcdir}/SOPE"
  patch configure ../sope_configure.patch
}

build() {
  cd "${srcdir}/SOPE"
  ./configure --prefix="/usr" --disable-strip --disable-debug
  make
}

package() {
  cd "${srcdir}/SOPE"
  make install DESTDIR="${pkgdir}"
}

sha256sums=('9a1c31a407ff3a7584d2364e92976e3e9336c8ebaa47223bd9dde5a2be2f129c'
            '7ff3387daffd15b5f97146da1fd61aefc9591b7b6a41f1f0e60b572106fdbc9a')

