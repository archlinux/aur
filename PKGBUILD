# Maintainer: Burobin Alexander <alexandrburobin@gmail.com>

pkgname="gswatcher"
pkgver="1.7.0"
pkgrel=1

pkgdesc="A simple game server browser and an administrative tool"
url="https://github.com/lxndr/gswatcher"
arch=(x86_64)
license=(GPL2)
depends=("libgee" "gtk4>=4.6.1" "libadwaita>=1:1.3.0" "lua>=5.4.6" "geoip" "geoip-database-extra" "iso-flag-png")
makedepends=("meson" "ninja" "vala>=0.56.13")

source=("https://github.com/lxndr/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e706a4e71ab278f31dd0677107c5d5ccc9b14abc183853c459a17a05d08a0fd')

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

