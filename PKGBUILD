# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering7
pkgver=7.4.2
pkgrel=3
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
  )
optdepends=('optix: Nvidia OptiX rendering engine plugin')
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('b35d41ae611f96bb755aa4dd1f31b389f514220bdae9192d24ba2b17cbcd2def')

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
