# Maintainer: storbake
pkgname=wallpaper_splitter
pkgver=1.4.0
pkgrel=1
pkgdesc="Split and span a single wallpaper across multiple screens on KDE Plasma"
url="https://github.com/kstorbakken/wallpaper_splitter"
license=('GPL-3.0-only')
arch=('x86_64')
depends=(
  'kconfigwidgets'
  'qt6-base'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6967b8f6f1619b89bdafe3ec4da5b275bf839332d19c781c22c0ac1ac4bc06c8')

build() {
  cmake -S "${pkgname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
