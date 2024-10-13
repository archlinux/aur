# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.6.8
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
b2sums=(2404e6ba355341aa02eea33c9a298b0214b7ef1eee3c95a30af00a4fea1bf6095121fc21ea5df1e29120be4250f6071672afad2ccfd57a87fd70da4229873213)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
