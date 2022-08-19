# Maintainer: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=mepo
pkgver=0.5
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
makedepends=('zig>=0.9')
checkdepends=('zig>=0.9')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('76aa81e4644e5727b1ab54379f92377243e237fa9c17b302978b86c332377995a1059ad608fe8974c6c426267352b450fc8b2f9265973ef1b99e44e79375cc94')
sha256sums=('9107c0783f9e9daad983060cf16013e0ee919524d2b323fa8a5dc81d88754f1c')

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

