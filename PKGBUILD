# Maintainer: Kelsey <kelseythedreamer@noreply.codeberg.org>

pkgname=librarywm
pkgver=0.1
pkgrel=1
pkgdesc="A tiling WM for X11 with floating, tiling, and scrolling layouts"
arch=('x86_64')
url="https://codeberg.org/kelseythedreamer/librarywm"
license=('GPL2')
depends=(
  'libxcb'
  'xcb-util'
  'xcb-util-wm'
  'xcb-util-keysyms'
  'xcb-util-cursor'
  'lua'
  'cairo'
)
makedepends=('cmake' 'ninja')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6e57d63ed149421835e2f987dd85f682d3aa2e3eb89bd47d4c9ec4d186481c57')

build() {
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BAR=ON \
    -DENABLE_ANIMATIONS=ON \
    -Wno-dev
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
