# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: rabyte <rabyte__gmail>
pkgname=karmen-svn
_pkgname=karmen
pkgver=r397
pkgrel=1
pkgdesc="An easy-to-use window manager of simple design"
arch=('i686' 'x86_64')
url="http://karmen.sourceforge.net/"
license=('MIT')
depends=('libx11')
makedepends=('svn')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::svn://svn.code.sf.net/p/$_pkgname/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  autoreconf -iv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
