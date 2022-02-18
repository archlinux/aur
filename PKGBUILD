# Maintainer: Burobin Alexander <lxndr87i@gmail.com>

pkgname="gswatcher"
pkgver="1.6.0alpha.4"
_pkgver="1.6.0-alpha.4"
pkgrel=2

pkgdesc="A simple game server browser and an administrative tool"
url="https://gitlab.com/lxndr-ab/gswatcher"
arch=(x86_64 armv7h aarch64)
license=(GPL3)
depends=(libgee "gtk4>=4.6.1" "libadwaita>=1:1.0.2" "duktape>=2.6.0" geoip)
makedepends=(meson ninja "vala>=0.54.7")

source=("https://gitlab.com/lxndr-ab/$pkgname/-/archive/$_pkgver/$pkgname-$_pkgver.tar.bz2")
sha256sums=('e3c71ebd6c965cb47e2e0d68930690e2a9425457f76c1c951ce591f8ec896e4b')

build() {
  local meson_options=(
    -D tests=false
  )

  arch-meson "$pkgname-$_pkgver" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
