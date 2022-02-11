# Maintainer: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=0.3
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl')
makedepends=('zig=0.8.1' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
checkdepends=('zig=0.8.1')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8fe6c044c139a614795b244532ac7a85de9c291e7033be68b1dd32b8882550e839a14611d2e85789842b78f1393ebf0e7793878777e78771dda44245ec82e115')
sha256sums=('c802edb9c472ab8fe20bd8995f9bba4d16396e856da0d90ad9d5ec73148b9587')

build() {
  cd "$pkgname-$pkgver"

  zig build -Drelease-safe=true
}

check() {
  cd "$pkgname-$pkgver"

  zig build test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install scripts/mepo_* "$pkgdir/usr/bin/"
  install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
}

