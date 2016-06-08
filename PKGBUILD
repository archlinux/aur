# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=beef
pkgver=1.0.1
pkgrel=1
pkgdesc='Flexible interpreter for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='http://kiyuko.org/software/beef'
license=('GPL')
depends=('cattle')
makedepends=('addinclude')
source=("$pkgname-$pkgver.tgz::http://kiyuko.org/software/$pkgname/releases/$pkgver/source")
sha256sums=('112472c832c623a6d8a90e12cd9f5fb55d93658d0bd181273c7149b11c4f5df8')

prepare() {
  cd "$pkgname-$pkgver"

  addinclude -t src/main.c stdio
  addinclude -t src/io.c stdio
  echo '#!/bin/sh' > beef.sh
  echo 'TERM=kterm /usr/bin/beef.elf "$@"' >> beef.sh
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"
  mv "$pkgdir/usr/bin/beef" "$pkgdir/usr/bin/beef.elf"
  install -Dm755 beef.sh "$pkgdir/usr/bin/beef"
}

# getver: kiyuko.org/software/beef/releases
# vim:set ts=2 sw=2 et:
