# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=avif
pkgver=0.6.2
pkgrel=2
pkgdesc="Library for encoding and decoding .avif files"
arch=('i686' 'x86_64')
url="https://github.com/AOMediaCodec/libavif"
license=('BSD')
depends=('glibc' 'aom' 'dav1d' 'libpng')
makedepends=('git' 'cmake' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AOMediaCodec/libavif/archive/v$pkgver.tar.gz")
sha256sums=('e3d53235ca8691d223567160757f3930b0f9b9c5bb0a1f15ebbdde042b2a19fa')


build() {
  cd "lib$pkgname-$pkgver"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_CODEC_AOM=ON \
    -DAVIF_CODEC_DAV1D=ON \
    ../
  make
}

package() {
  cd "lib$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/avif"
}
