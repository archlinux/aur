# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=blosc2
pkgver=2.0.4
pkgrel=1
pkgdesc="Next generation c-blosc"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://blosc-doc.readthedocs.io/en/latest/"
license=('BSD')
depends=('lz4' 'zlib' 'zstd')
makedepends=('cmake' 'ninja')
options=('staticlibs')
source=("https://github.com/Blosc/c-blosc2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90c78edcc262759dd16d243141513310624bb4fda3d98ac34dcfb78255e151c1')

build() {
  cd c-${pkgname}-${pkgver}

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DPREFER_EXTERNAL_LZ4="ON" \
    -DPREFER_EXTERNAL_ZLIB="ON" \
    -DPREFER_EXTERNAL_ZSTD="ON" \
    -GNinja \
    ./
  ninja -C "_build"
}

package() {
  cd c-${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C "_build" install
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/blosc2"
}
