# Maintainer: Burobin Alexander <alexandrburobin@gmail.com>

pkgname="gswatcher"
pkgver="1.6.5"
pkgrel=1

pkgdesc="A simple game server browser and an administrative tool"
url="https://github.com/lxndr/gswatcher"
arch=(x86_64)
license=(GPL2)
depends=(libgee "gtk4>=4.6.1" "libadwaita>=1:1.3.0" "lua>=5.4.6" geoip)
makedepends=(meson ninja "vala>=0.56.13")

source=("https://github.com/lxndr/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86d2e3bb1079f5281a784a2e45bb4190a5343d179add1d51a425fd7b61ed7359')

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

