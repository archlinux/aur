# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-common6
pkgver=6.2.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Gazebo Common, a component of Gazebo, provides a set of libraries that cover many different use cases."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'assimp'
  'ffmpeg'
  'freeimage'
  'gdal'
  'glibc'  # libdl
  'gts'
  'gz-math=8'
  'gz-utils=3'
  'tinyxml2'
  'util-linux-libs' # uuid
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('e6d6b1f4bb174366ad8cc237ff0e33b6bcde2e16c3f9350665881e28eedb8ad8')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
}

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
