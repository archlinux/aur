# Maintainer : David Phillips < david sighup nz >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=beef
pkgver=1.0.2
pkgrel=1
pkgdesc='Flexible interpreter for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='https://kiyuko.org/software/beef'
license=('GPL')
depends=('cattle')
makedepends=('addinclude' 'pandoc')
source=("https://kiyuko.org/software/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5febdb9504fbc8d292e7678f8fe9e9758e915ef2cd8252d0f1a502c93e3b51e6')

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
