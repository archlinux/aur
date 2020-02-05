# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=4.0.0
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfr.dev"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake clang)
depends=()
source=("https://github.com/kfrlib/kfr/archive/$pkgver.tar.gz")
sha256sums=("54311b5634ae9b9004996ff5ce0616dc5604e1cfdf859266043f7c8c06e9b1c2")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
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
