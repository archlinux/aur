# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=4.2.0
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfr.dev"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake clang)
depends=()
source=("${pkgname}-${pkgver}::https://github.com/kfrlib/kfr/archive/$pkgver.tar.gz")
sha256sums=("45f1a5cce8f86dcfc60ae79c0fbab3f0877983a736db2e53a02af85604cdaa1d")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_CXX_COMPILER=clang \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_CAPI_BUILD=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
