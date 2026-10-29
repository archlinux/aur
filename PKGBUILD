# Maintainer: storbake
pkgname=wallpaper_splitter
pkgver=1.5.0
pkgrel=1
pkgdesc="Split and span a single wallpaper across multiple screens on KDE Plasma"
url="https://github.com/kstorbakken/wallpaper_splitter"
license=('GPL-3.0-only')
arch=('x86_64')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'kconfigwidgets'
  'qt6-base'
  'qt6-imageformats'
  'qt6-wayland'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad2abe67e6dd26fa653b0e04ee9349441815e8d66ce362071ad542a97fe61232')

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
