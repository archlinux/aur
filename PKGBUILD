# Maintainer: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=mepo
pkgver=0.4.2
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
sha512sums=('d136c38aeab869713df4a79d9bde40674a828fdcfa0cb2af92a30d7f11f0c8ef0ea7cc7fd162d329dea4a279d71363afcdd53913f8dbeb8cc33be08cc86257ae')
sha256sums=('2f929ce248321c70a9f5504f10991d6da08f110501a7f1a257bc7ffcd286652d')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="$startdir/remove_zig_version_check.patch"
}

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

