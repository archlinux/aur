# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-common6
pkgver=6.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Gazebo Common, a component of Gazebo, provides a set of libraries that cover many different use cases."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
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
sha256sums=('13eb0ea1cd756c17cf399afacaf4b704dcf9f4f20512e1a4f5504fe4a5bd1f61')

build() {
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
