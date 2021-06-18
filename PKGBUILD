# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=blosc2
_pkgver=2.0.0-rc2
pkgver=2.0.0_rc2
pkgrel=1
pkgdesc="Next generation c-blosc"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://blosc-doc.readthedocs.io/en/latest/"
license=('BSD')
depends=('lz4' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'ninja')
options=('staticlibs')
source=("https://github.com/Blosc/c-blosc2/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('d07aa234f48123a4c4cb66b6936adc6e2144e7e5e7ec19f806739439733af4f1')

build() {
  cd c-${pkgname}-${_pkgver}

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
  cd c-${pkgname}-${_pkgver}

  DESTDIR="$pkgdir" ninja -C "_build" install
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/blosc2"
}
