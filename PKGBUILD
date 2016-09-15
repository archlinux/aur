# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qt5-styleplugins-nogconf-git
_pkgname=qtstyleplugins
pkgver=5.0.0.r9.7b11d50
pkgrel=2
pkgdesc="Additional style plugins for Qt5 (without gconf)"
arch=('i686' 'x86_64')
url="http://code.qt.io/cgit/qt/qtstyleplugins.git"
license=('LGPL')
depends=('gtk2' 'qt5-base')
makedepends=('git')
provides=("qt5-styleplugins=$pkgver")
conflicts=("qt5-styleplugins")
source=("$_pkgname::git+https://code.qt.io/qt/qtstyleplugins.git"
        "qtstyleplugins_no_gconf.diff")
md5sums=('SKIP'
         '124030eef158dcf979ffeec6f7b5e2fd')
sha512sums=('SKIP'
            '0c506d01859118cd87ea7e09bfc5a40c5475610064ee90510409ac083f6a20441d01cb5390ff7aa11a862fbc5009596eddc030e4ac01ec07653ef44d6f44dd08')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_pkgname"
  patch -Np1 < "$srcdir/qtstyleplugins_no_gconf.diff"
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
