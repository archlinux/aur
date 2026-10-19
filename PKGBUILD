# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering10
pkgver=10.1.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=7'
  'gz-math=9'
  'gz-plugin=4'
  'gz-utils=4'
  'ogre-next'
  )
makedepends=(
  'cmake'
  'boost'
  'doxygen'
  'gz-cmake=5'
  'vulkan-headers'
  )
optdepends=(
  'optix: Nvidia OptiX rendering engine plugin'
  'ogre-1.9: Ogre 1.x rendering enging plugin'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('06025fa77f1306091e42eb96bb1f0657633f8875446d2338cd625d3b5b6e7015')

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
