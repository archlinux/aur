# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-common5
pkgver=5.5.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Gazebo Common, a component of Gazebo, provides a set of libraries that cover many different use cases."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'assimp'
  'ffmpeg4.4'
  'freeimage'
  'gdal'
  'glibc'  # libdl
  'gts'
  'gz-math=7'
  'gz-utils=2'
  'tinyxml2'
  'util-linux-libs' # uuid
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('cab7512206975b70a846aca18c210ef1977502892866c54cec9040c90a4a037c')

build() {
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/ffmpeg4.4/pkgconfig"
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
