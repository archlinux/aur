# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=5.2.0
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfr.dev"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake clang)
depends=()
source=("${pkgname}-${pkgver}::https://github.com/kfrlib/kfr/archive/$pkgver.tar.gz")
sha256sums=("8597b7334cf9f317daeeb64615d562a1374545e8c196b06a86705c7a391c6761")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=clang \
        -DBUILD_SHARED_LIBS=ON \
        -DKFR_ENABLE_CAPI_BUILD=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
