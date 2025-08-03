# Maintainer: Stella <jens300304@gmail.com>
# Maintainer: utrack <aur@koptelov.me>
pkgname=libsleef
url="https://sleef.org"
pkgver=3.9.0
pkgrel=1
pkgdesc="SIMD Library for Evaluating Elementary Functions, vectorized libm and DFT"
arch=('any')
license=('Boost')
source=(
    "https://github.com/shibatch/sleef/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('af60856abac08a3b5e72a8d156dd71fec1f7ac23de8ee67793f45f9edcdf0908')
depends=()
makedepends=('openmp')
checkdepends=(
    'mpfr'
    'openssl'
    'fftw'
)

build() {
    cd "$srcdir/sleef-${pkgver}"
    cmake -S . -B build/ -DCMAKE_INSTALL_PREFIX="./install"
    cmake --build build/ --clean-first
}

check() {
    cd "$srcdir/sleef-${pkgver}"
    ctest --test-dir build/
}
package() {
    cd "$srcdir/sleef-${pkgver}"
    cmake --install build/
    mkdir -p "$pkgdir/usr"
    cp -r "./install/include" "$pkgdir/usr/include"
    cp -r "./install/lib" "$pkgdir/usr/lib"
}