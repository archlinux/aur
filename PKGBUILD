# Contributor: David Phillips < david sighup nz >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=beef
pkgver=1.2.0
pkgrel=1
pkgdesc='Flexible interpreter for the Brainfuck programming language'
arch=('x86_64')
url='https://kiyuko.org/software/beef'
license=('GPL-2.0-only')
depends=('cattle')
source=("$url/releases/${pkgname}-${pkgver}.tar.xz")
sha256sums=('45aba7729cf736eea27f4efdba2a12f094f8ca62f7eda79b4937444fc1b6952e')

prepare() {
  cd "$pkgname-$pkgver"
  echo '#!/bin/sh' > beef.sh
  echo 'TERM=kterm /usr/bin/beef.elf "$@"' >> beef.sh
}

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make install DESTDIR="$pkgdir"
  mv "$pkgdir/usr/bin/beef" "$pkgdir/usr/bin/beef.elf"
  install -Dm755 ../beef.sh "$pkgdir/usr/bin/beef"
}

# getver: kiyuko.org/software/beef/releases
# vim:set ts=2 sw=2 et:
