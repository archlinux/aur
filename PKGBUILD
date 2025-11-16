# Maintainer: Alexander Burobin <alexandrburobin@gmail.com>

pkgname="gswatcher"
pkgver="1.7.5"
pkgrel=1

pkgdesc="A simple game server browser and an administrative tool"
url="https://github.com/lxndr/gswatcher"
arch=(x86_64)
license=(GPL2)
depends=("libgee" "gtk4>=4.6.1" "libadwaita>=1:1.3.0" "lua>=5.4.6" "geoip" "geoip-database-extra" "iso-flag-png")
makedepends=("meson" "ninja" "vala>=0.56.13")

source=("https://github.com/lxndr/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7bc58525c732816f4f588c25842c64b48428cedc76db5f4cd51669da4785a4f')

build() {
  local meson_options=(
    -D tests=false
  )

  arch-meson "$pkgname-$pkgver" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

