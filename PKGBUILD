# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyemu
pkgver=2018_09_23
pkgrel=1
pkgdesc='RISC-V system emulator'
arch=('x86_64')
url='https://bellard.org/tinyemu/'
license=('MIT')
depends=('sdl')
makedepends=('setconf')
source=("https://bellard.org/tinyemu/$pkgname-${pkgver//_/-}.tar.gz")
sha256sums=('9b58d5521df8356c3be09a520387d3e4adcb510cf8d2fd6bdd971287bd57d734')

prepare() {
  cd "$pkgname-${pkgver//_/-}"

  setconf Makefile bindir /usr/bin
}

build() {
  make -C "$pkgname-${pkgver//_/-}"
}

package() {
  cd "$pkgname-${pkgver//_/-}"

  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT-LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
