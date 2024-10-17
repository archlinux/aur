# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.7.1
pkgrel=2
pkgdesc="A convenient alternative to GOverlay for configuring MangoHud"
arch=(x86_64)
url="https://github.com/radiolamp/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  gtk4
  libadwaita
  libgee
)
makedepends=(
  git
  meson
  vala
  mangohud
)

optdepends=(
  vulkan-tools
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(9fcf01b904afe25db3b6f71c0d1f201adfd578d2e74acb67b10ef5abce625ab4afa20d332267aa2d7672089902ed6ecefe65a71fce35d52090dfbcb7e86d7d53)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
