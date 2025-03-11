# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-msgs9
pkgver=9.5.1
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Messages for Gazebo robot simulation."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-math=7'
  'gz-tools=2'
  'gz-utils=2'
  'protobuf-c'
  'protobuf'
  'python'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('1bd026087705000c73ac135edd1bcdfcb60b9b79919c2913ddc1f36f7bd52559')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
