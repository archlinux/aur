pkgname=sz
pkgver=2.1.9
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets)"
license=('custom')
arch=('x86_64')
url="https://szcompressor.github.io/homepage/"
depends=('zstd')
makedepends=('cmake')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('491724ff1c0eaaab5e1a7a28e36aba6da9dcbeddb29d8d21a6d1388383d4891e')

build() {
  cd SZ-$pkgver
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        ..
  make
}

package() {
  cd SZ-$pkgver/build
  make DESTDIR="$pkgdir" install
}

