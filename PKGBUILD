# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.7.7
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
b2sums=(135a3e9cf622c02f9376582c96e4c5baa5d638f67cc2f1dcbe1bc8eea0a2b1480e51733d68374e686b4627145f8b3b2db3a8f8df53e68f4243538aa251a4fe29)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
