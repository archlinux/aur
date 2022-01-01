# Maintainer: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=0.2
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl')
makedepends=('zig=0.8.1' 'sdl2' 'sdl2_image' 'sdl2_ttf')
checkdepends=('zig=0.8.1')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('23e052b00e106598a80c357f6e565da8d8ad334efeda3873b27f86f6aa87c8979f17f3f800424fd6eabd533d6cf99b2047dcd07dd6046a004554fa287c8c0394')
sha256sums=('413a5b96b1b6e78090ce74eac639180290624559fe072743832e27f1034ed026')

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

