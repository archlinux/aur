# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=6.0.2
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfrlib.com/"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake clang)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kfrlib/kfr/archive/$pkgver.tar.gz")
sha256sums=("0b9217d5d9e153da68637a61254dfb4faf50214f0d83a25efc73849540e0c95b")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=clang \
        -DBUILD_SHARED_LIBS=ON \
        -DKFR_ENABLE_CAPI_BUILD=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
