# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering9
pkgver=9.4.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'freeimage'
  'gz-common=6'
  'gz-math=8'
  'gz-plugin=3'
  'gz-utils=3'
  'ogre-next2'
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
sha256sums=('7d705a5735e8cacba2b02a7ddf5343f89673bf4c86714872163ee10f1def3b0b')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
