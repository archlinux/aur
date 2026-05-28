# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-physics7
pkgver=7.7.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Abstract physics interface designed to support simulation and rapid development of robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-common=5'
  'gz-math=7'
  'gz-plugin=2'
  'gz-utils=2'
  'sdformat=14'
  'bullet'
  'libdart'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
optdepends=(
  #'libdart: DARTsim physics plugin'
  #'bullet: bullet physics plugin'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('65f91353a6f10656d641de621f3a39a629cce0d6be1bd2433789e7399b749327')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

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
