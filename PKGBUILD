# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.6.2
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
b2sums=(587ab594d4ea11e28f2f331faaf7aba4221cbce868ecb4e0a361a8a2eedb94a5c11bc44af20db43bfcbd0a582cea240af5bf2df965ddea6bada9e82467090562)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
