# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.7.0
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
)

optdepends=(
  vulkan-tools
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(0db3705b925c3668bab8cf684e252add079f2b58b16b6293e2c667d86203defcc933111df0236b0a35207ca83cd7626c0e4601b59076c38cbec32dcedf127e68)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
