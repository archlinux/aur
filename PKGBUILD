# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=matplotplusplus-git
pkgver=r437.2a8eada
pkgrel=2
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
url="https://alandefreitas.github.io/matplotplusplus/"
arch=(x86_64)
license=('MIT')
makedepends=(cmake)
depends=(gnuplot)
source=("${pkgname}::git+https://github.com/alandefreitas/matplotplusplus")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/${pkgname}/build"
  cd "$srcdir/${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DBUILD_SHARED_LIBS=ON \
        -DMATPLOTPP_BUILD_EXAMPLES=OFF \
        -DMATPLOTPP_BUILD_TESTS=OFF \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESDIR=${pkgdir} install
}
