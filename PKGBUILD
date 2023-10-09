# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering8
pkgver=8.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'freeimage'
  'gz-common=5'
  'gz-math=7'
  'gz-plugin=2'
  'gz-utils=2'
  'gz-ogre-next'
  )
makedepends=(
  'cmake'
  'boost'
  'doxygen'
  'gz-cmake=3'
  'vulkan-headers'
  )
optdepends=('optix: Nvidia OptiX rendering engine plugin')
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('9155927d2ed13237c0aab6b0dafbfdc87eac91213341f8559c9d84c0eebbbe25')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
