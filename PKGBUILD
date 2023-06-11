# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=matplotplusplus
pkgver=1.2.0
pkgrel=2
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
url="https://alandefreitas.github.io/matplotplusplus"
arch=(x86_64)
license=('MIT')
makedepends=(cmake)
depends=(gnuplot)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v$pkgver.tar.gz")
sha256sums=('42e24edf717741fcc721242aaa1fdb44e510fbdce4032cdb101c2258761b2554')

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DBUILD_SHARED_LIBS=ON \
        -DMATPLOTPP_BUILD_EXAMPLES=OFF \
        -DMATPLOTPP_BUILD_TESTS=OFF \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
