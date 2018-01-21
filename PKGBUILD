# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>
# Contributor:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope2
pkgver=2.3.23
pkgrel=1
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
conflicts=('sope')
options=('!strip')
source=("http://www.sogo.nu/files/downloads/SOGo/Sources/SOPE-${pkgver}.tar.gz"
        "sope_configure.patch")

sha256sums=('fa6e30a5ceb7a09315aa04f41f3b088ed5f43d9ddca833c326c3bec9995177b9'
            '7ff3387daffd15b5f97146da1fd61aefc9591b7b6a41f1f0e60b572106fdbc9a')

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

