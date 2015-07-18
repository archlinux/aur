# Maintainer:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Maintainer: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgver=2.3.0
pkgrel=1
pkgdesc="application server used by SOGo"
arch=('i686' 'x86_64')
url="http://www.sogo.nu/files/downloads/SOGo/Sources/"
license=('GPL')
depends=('gnustep-base')
makedepends=('gcc-objc')
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

sha256sums=('fa493a1b07e179f731379e4a48deb12f6129e1206a2a9e42fdba1482bad3da12'
            '7ff3387daffd15b5f97146da1fd61aefc9591b7b6a41f1f0e60b572106fdbc9a')

