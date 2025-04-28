# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.3
pkgrel=3
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
b2sums=(a8ebb82d9c6ca071481192c2305ce81fcddd4fcb8ff7fbc0318de52ef22fc0268c3ad3d66cbe0872765bd5589351e3b1e59f4cbb86fdb235321824fd99e9830d)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
