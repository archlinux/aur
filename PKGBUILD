# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.0
pkgrel=2
pkgdesc="A convenient alternative to GOverlay for configuring MangoHud"
arch=(any)
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
  fontconfig
)

optdepends=(
  vulkan-tools
  mesa-utils
  vkbasalt
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(c6363f44e2f1695be4d0f07445f26b81d704fd4f6330bb7fc137973c868ca168eabcdee84e66c90b90f4ace69799cd81219d7b0c06ca48635aa67950c5750eef)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
