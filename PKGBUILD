# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lzham
pkgver=1.0.1
_pkgver=1_0_stable1
pkgrel=3
pkgdesc="Lossless data compression codec with LZMA-like ratios but 1.5x-8x faster decompression speed"
license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/richgel999/lzham_codec"
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/richgel999/lzham_codec/archive/v$_pkgver.tar.gz")
sha256sums=('4f4f874706763b3a6e3d6dfff666a1e850ca1d92fd9240b2a14365c5864a0057')

build() {
  cd lzham_codec-$_pkgver
  install -d build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  cd lzham_codec-$_pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  rm -f "$pkgdir"/usr/include/zlib.h
}
