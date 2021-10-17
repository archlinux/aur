# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=caterva
pkgver=0.5.0
pkgrel=1
pkgdesc="C library for handling multi-dimensional, compressed datasets"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://caterva.readthedocs.io/en/latest/"
license=('BSD')
depends=('lz4' 'snappy' 'zlib' 'zstd' 'blosc2')
makedepends=('cmake')
options=('staticlibs')
source=("https://github.com/Blosc/caterva/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('733449b36e5e3ba8d87e254daae8bde9a3122510da75416743cbfed3003d9d38')

build() {
  cd ${pkgname}-${pkgver}

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCATERVA_PREFER_BLOSC2_EXTERNAL=yes \
    ./
  make -C "_build"
}

package() {
  cd ${pkgname}-${pkgver}

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/caterva"
}
