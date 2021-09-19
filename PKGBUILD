# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=libp11-git
_pkgname=libp11
pkgver=0.4.11.r39.g5126132
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/OpenSC/wiki"
license=('LGPL')
makedepends=('git')
depends=('openssl')
provides=("$_pkgname=${pkgver%%.r*}-${pkgrel}" 'engine_pkcs11')
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/OpenSC/libp11.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^libp11-,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}


build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
