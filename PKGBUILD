# Maintainer: Kelsey <kelseythedreamer@noreply.codeberg.org>

pkgname=librarywm
pkgver=0.2
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('05a3d9e3691acc4ff3deb2d4ac6bb231ea9e71a873d751ac66ae4b7327d6c891')

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
