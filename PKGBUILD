# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=blosc2
pkgver=2.0.1
pkgrel=1
pkgdesc="Next generation c-blosc"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://blosc-doc.readthedocs.io/en/latest/"
license=('BSD')
depends=('lz4' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'ninja')
options=('staticlibs')
source=("https://github.com/Blosc/c-blosc2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35b93dfed479b1dfd9372d41d7843b60254ed1d71792577b95e489c28705874f')

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
