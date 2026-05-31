# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-common7
pkgver=7.2.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Gazebo Common, a component of Gazebo, provides a set of libraries that cover many different use cases."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'assimp'
  'ffmpeg'
  'gdal'
  'glibc'  # libdl
  'gts'
  'gz-math=9'
  'gz-utils=4'
  'tinyxml2'
  'util-linux-libs' # uuid
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}-pre1.tar.gz")
sha256sums=('ab6cc8dc67657be6f8b56a50a42e3943b7f6450f9cf0d360599e12acba2fd509')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}-pre1" \
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
