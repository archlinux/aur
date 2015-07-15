# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=lua-fs
pkgver=0.3
pkgrel=5
epoch=
pkgdesc="Simple filesystem extension library for Lua"
arch=(any)
url="http://www.steve.org.uk/Software/lua/lua-fs/"
license=('LGPL')
groups=()
depends=(lua)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${url}$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(52e253fb86c71c201265074dc09a10e6) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -sEi 's#/usr/([a-z]+)/#${DESTDIR}\0/#' Makefile
  sed -sEi 's#lua50#lua/5.1/#' Makefile
  sed -si 's#/5.0#/5.1#' Makefile
  sed -si 's#cp default.lua.*libfs.lua##' Makefile
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cp libfs.so tests/
  make -k test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
