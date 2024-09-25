# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.6.1
pkgrel=1
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
  vulkan-tools
)

optdepends=(
  mesa-demos
  adwaita-icon-theme
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(afb25ec26ee040522998a7d4fe8a788c7e7df1950f5238e06cc8a4390e686b4c7b53ff427ab7189f59bdf9f991aaab668274a3688c2fc0afe43507c08bc312d6)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
