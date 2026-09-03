# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-physics9
pkgver=9.5.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Abstract physics interface designed to support simulation and rapid development of robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-common=7'
  'gz-math=9'
  'gz-plugin=4'
  'gz-utils=4'
  'sdformat=16'
  'bullet'
  'libdart'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  )
optdepends=(
  #'libdart: DARTsim physics plugin'
  #'bullet: bullet physics plugin'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('ce1c1aa9677dae333008789e2cd00c76e1a8841903d2cb4b49fc0347337425d3')

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
