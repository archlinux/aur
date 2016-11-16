# Maintainer:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgver=3.2.1
pkgrel=1
pkgdesc="application server used by SOGo"
arch=('i686' 'x86_64')
url="http://www.sogo.nu/files/downloads/SOGo/Sources/"
license=('GPL')
depends=('gnustep-base')
makedepends=('gcc-objc'
             'libxml2'
             'libmariadbclient'
             'libldap'
             'openssl'
             'postgresql-libs')
optdepends=('libxml2: parse XML coniguration files'
            'mariadb: run database server for sogo locally'
            'openldap: run directory server for sogo locally'
            'openssl: create SSL secured connectons'
            'postgresql: run database server for sogo locally')
replaces=('sope2')
provides=("sope2=${pkgver}-${pkgrel}")
options=('!strip')
source=("http://www.sogo.nu/files/downloads/SOGo/Sources/SOPE-${pkgver}.tar.gz"
        "sope_configure.patch")

prepare() {
  cd "${srcdir}/SOPE"
  patch configure ../sope_configure.patch
}

build() {
  cd "${srcdir}/SOPE"
  ./configure --with-gnustep --disable-strip --disable-debug
  make
}

package() {
  cd "${srcdir}/SOPE"
  make install DESTDIR="${pkgdir}"
}

sha256sums=('ed2124b3c7219c9475fe918e8ab1564b8f71d68c3cd8599f6e61b5574ae10433'
            '7ff3387daffd15b5f97146da1fd61aefc9591b7b6a41f1f0e60b572106fdbc9a')

