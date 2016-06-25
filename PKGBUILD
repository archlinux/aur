# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qt5-styleplugins-nogconf-git
_pkgname=qtstyleplugins
pkgver=5.0.0.r7.5f2549b
pkgrel=1
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
         'a05109f61f24d0ba059f34eea5a3b723')
sha512sums=('SKIP'
            '413e27854171ee5f50110aebf9755bc45fb538bf0551f103d62a077680c1f266205d9ab868f13e1bf8e6c828d9e8f975010555adef5234662478c97e8de5c459')

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
