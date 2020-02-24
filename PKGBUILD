# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyemu
pkgver=2019_12_21
pkgrel=1
pkgdesc='RISC-V system emulator'
arch=(x86_64)
groups=(risc-v)
url='https://bellard.org/tinyemu/'
license=(MIT)
depends=(curl sdl)
makedepends=(setconf)
source=("$url$pkgname-${pkgver//_/-}.tar.gz")
sha256sums=('be8351f2121819b3172fcedce5cb1826fa12c87da1b7ed98f269d3e802a05555')

prepare() {
  local m="$pkgname-${pkgver//_/-}/Makefile"
  setconf "$m" bindir="/usr/bin"
  setconf "$m" CFLAGS="-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -MMD $CFLAGS -w"
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
