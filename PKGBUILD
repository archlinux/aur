# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering9
pkgver=9.0.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'freeimage'
  'gz-common=6'
  'gz-math=8'
  'gz-plugin=3'
  'gz-utils=3'
  'ogre-next<3.0.0'
  )
makedepends=(
  'cmake'
  'boost'
  'doxygen'
  'gz-cmake=4'
  'vulkan-headers'
  )
optdepends=(
  'optix: Nvidia OptiX rendering engine plugin'
  'ogre-1.9: Ogre 1.x rendering enging plugin'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('3eb56a495c61e9274e24421f54ee074b01745c8d02f8f0e877aa346d562a3d32')

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
