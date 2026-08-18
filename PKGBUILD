# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-msgs11
pkgver=11.2.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Messages for Gazebo robot simulation."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-math=8'
  'gz-tools=2'
  'gz-utils=3'
  'protobuf-c'
  'protobuf'
  'python'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('c752b2d446511788fa9eb5cf9a7128d129f9e5fb3f678d737d2a2927679f3c9f')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
