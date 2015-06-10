# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=beef
pkgver=1.0.0
pkgrel=3
pkgdesc='Flexible interpreter for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='http://kiyuko.org/software/beef'
license=('GPL')
depends=('cattle')
makedepends=('addinclude')
source=("$pkgname-$pkgver.tgz::http://kiyuko.org/software/$pkgname/releases/1.0.0/source")
sha256sums=('cd730b01173e615bfe04569df9aef4a39cf2d1295df0417c1d787b86e6fb4004')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  addinclude -t src/main.c stdio
  addinclude -t src/io.c stdio
  echo '#!/bin/sh' > beef.sh
  echo 'TERM=kterm /usr/bin/beef.elf "$@"' >> beef.sh
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"
  mv "$pkgdir/usr/bin/beef" "$pkgdir/usr/bin/beef.elf"
  install -Dm755 beef.sh "$pkgdir/usr/bin/beef"
}

# vim:set ts=2 sw=2 et:
