# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-physics8
pkgver=8.1.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Abstract physics interface designed to support simulation and rapid development of robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-common=6'
  'gz-math=8'
  'gz-plugin=3'
  'gz-utils=3'
  'sdformat=15'
  'bullet'
  'libdart'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  )
optdepends=(
  #'libdart: DARTsim physics plugin'
  #'bullet: bullet physics plugin'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('61eeda1dd504a8feee6b095700d8ae37e83087611c12abf9fc873084e2f765f9')

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
