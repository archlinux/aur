# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=blosc2
pkgver=2.2.0
pkgrel=1
pkgdesc="Next generation c-blosc"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://blosc-doc.readthedocs.io/en/latest/"
license=('BSD')
depends=('lz4' 'zlib' 'zstd')
makedepends=('cmake' 'ninja')
options=('staticlibs')
source=("https://github.com/Blosc/c-blosc2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66f9977de26d6bc9ea1c0e623d873c3225e4fff709aa09b3335fd09d41d57c0e')

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
