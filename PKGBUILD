# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.3.r35.g970baad
pkgrel=1
pkgdesc="A convenient alternative to GOverlay for configuring MangoHud"
arch=(any)
url="https://github.com/radiolamp/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  gtk4
  fontconfig
  libadwaita
  libgee
  mangohud
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  mesa-utils
  vulkan-tools
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  arch-meson -Dis_devel=true ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
