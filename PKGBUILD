# Maintainer: Kelsey <kelseythedreamer@noreply.codeberg.org>

pkgname=librarywm-git
_pkgname=librarywm
pkgver=0.1.r0.g3382478
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
makedepends=('cmake' 'ninja' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

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
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
