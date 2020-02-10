# Maintainer: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=jzintv
pkgver=20181225
pkgrel=1
pkgdesc="Intellivision Emulator"
arch=('x86_64')
url="http://spatula-city.org/~im14u2c/intv/"
license=('GPL')
depends=('gcc-libs' 'sdl')
provides=('jzintv')
source=(http://spatula-city.org/~im14u2c/intv/dl/$pkgname-20181225-src.zip)
sha512sums=('2c7a72b925d1765e0857e805dd6d93800bcc516d3eeb40b8dff59d13cedc3aef778588fba0b04321dbbffb7ab1597c4303dedfda1fe37ff83a20f22686f0feaa')

prepare() {
  cd "$srcdir/$pkgname-20180509-src/src"
  sed -i -e 's/WARN   += -Werror -Wstrict-aliasing/WARN   += -w -Wstrict-aliasing/g' Makefile.linux
  sed -i -e 's/gcc-8.1.0 -std=c99/gcc -std=c99/g' Makefile.linux
  sed -i -e 's/g++-8.1.0 -std=c++14/g++ -std=c++14/g' Makefile.linux
}

build() {
  cd "$srcdir/$pkgname-20180509-src/src"
  make -f Makefile.linux
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/jzintv
  mkdir $pkgdir/usr/share/jzintv/examples
  mkdir $pkgdir/usr/share/jzintv/rom
  cp -a $srcdir/$pkgname-20180509-src/bin/* $pkgdir/usr/bin
  cp -a $srcdir/$pkgname-20180509-src/examples/* $pkgdir/usr/share/jzintv/examples
  cp -a $srcdir/$pkgname-20180509-src/rom/* $pkgdir/usr/share/jzintv/rom
}
