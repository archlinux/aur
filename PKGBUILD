# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-physics8
pkgver=8.0.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Abstract physics interface designed to support simulation and rapid development of robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
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
sha256sums=('58ecf05966c901ff09d378e2ab151de40bc0a5e6a46fe25989730ce13c5cbf56')

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
