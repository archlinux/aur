# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-tools2
pkgver=2.0.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Command line tools for the Gazebo libraries"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=()
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('93c1f6e91ae82671d66b55929aff07f89df7ac20182d8bca44a2f7204792725c')

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
