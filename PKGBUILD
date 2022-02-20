# Maintainer: Burobin Alexander <lxndr87i@gmail.com>

pkgname="gswatcher"
pkgver="1.6.0"
pkgrel=1

pkgdesc="A simple game server browser and an administrative tool"
url="https://gitlab.com/lxndr-ab/gswatcher"
arch=(x86_64 armv7h aarch64)
license=(GPL3)
depends=(libgee "gtk4>=4.6.1" "libadwaita>=1:1.0.2" "duktape>=2.6.0" geoip)
makedepends=(meson ninja "vala>=0.54.7")

source=("https://gitlab.com/lxndr-ab/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('da93e0d4f837692a82fc593a54806498b593ab4fce72c543f6f34fd76c2e2042')

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
