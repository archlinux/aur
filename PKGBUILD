# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.6
pkgrel=1
pkgdesc="A convenient alternative to GOverlay for configuring MangoHud"
arch=(any)
url="https://github.com/radiolamp/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  gtk4
  libadwaita
  libgee
  mangohud
  fontconfig
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  vulkan-tools
  mesa-utils
  vkbasalt
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(29e4f4ebfdd54204fb7c20831212f9e4724bc90feb1bcdbedf4a8efdf85baadd25608d19bf11033a2d68cd8f608b6ae693d864fa304c6d2f3b683e6d9d2e81e4)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
