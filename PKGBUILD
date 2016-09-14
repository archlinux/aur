# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qt5-styleplugins-nogconf-git
_pkgname=qtstyleplugins
pkgver=5.0.0.r9.7b11d50
pkgrel=1
pkgdesc="Additional style plugins for Qt5 (without gconf)"
arch=('i686' 'x86_64')
url="http://code.qt.io/cgit/qt/qtstyleplugins.git"
license=('LGPL')
depends=('gtk2' 'qt5-base')
makedepends=('git')
provides=("qt5-styleplugins=$pkgver")
conflicts=("qt5-styleplugins")
source=("$_pkgname::git+https://code.qt.io/qt/qtstyleplugins.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
  rm -r "$pkgdir/usr/lib/cmake"
}
