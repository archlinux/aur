# Maintainer: severaltranscats (cleo@cleo.nyc)
_pkgname=QGeoView
pkgname=qgeoview
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/AmonRaNet/QGeoView'
license=("LGPL-3.0-or-later")
pkgdesc='A Qt / C++ widget for visualizing geographic data.'
depends=('qt6-base')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AmonRaNet/QGeoView/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('932ff503effdb3257e2f8ce6d925a3b72c13b98564d73e7babde564ac0a4c5e6')

prepare() {
  mkdir -p build
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgname-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_EXAMPLES=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd build
  DESTDIR="$pkgdir" cmake --install .
}

