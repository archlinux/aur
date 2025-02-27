# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.2
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
b2sums=(630f20877f6d698db3cc68749b8b48408f81824b87149fc6e6304b4e45601a00a521b9747274e494eaf264a6311274024a58aca1b3a3280931b83d003523756f)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
