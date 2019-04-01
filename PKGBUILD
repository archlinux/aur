# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyemu
pkgver=2019_02_10
pkgrel=2
pkgdesc='RISC-V system emulator'
arch=(x86_64)
groups=(risc-v)
url='https://bellard.org/tinyemu/'
license=(MIT)
depends=(curl sdl)
makedepends=(setconf)
source=("https://bellard.org/tinyemu/$pkgname-${pkgver//_/-}.tar.gz")
sha256sums=('0a2ded13a51bc3d6e69afd29c6a4709b327256ea36e562a5d9fa253cd224fa5b')

prepare() {
  local m="$pkgname-${pkgver//_/-}/Makefile"
  setconf "$m" bindir="/usr/bin"
  setconf "$m" CFLAGS="-O2 -Wall -g -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -MMD $CFLAGS -w"
  setconf "$m" LDFLAGS="$LDFLAGS"
}

build() {
  make -C "$pkgname-${pkgver//_/-}"
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
  install -Dm644 readme.txt \
    "$pkgdir/usr/share/doc/$pkgname/readme.txt"
  install -Dm644 MIT-LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
