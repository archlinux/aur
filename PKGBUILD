# Maintainer: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=0.1
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl')
makedepends=('zig>=0.8.1' 'sdl2' 'sdl2_image' 'sdl2_ttf')
checkdepends=('zig>=0.8.1')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1635f0e8124e52118d4e6f376b0239ea5e38063d09fbc8a72dd66d06fa87a49f8db8bb62d997e693714f594b812e16f0b9e692ae8ceebf1803a6b8f5f1b2bc03')
sha256sums=('57d259a6b4bbe868130c95a409b7cbdea5b63f54e1d6356a6104fa0102b82cc8')

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

