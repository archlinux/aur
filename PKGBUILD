pkgname=sz
pkgver=2.1.8.3
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets)"
license=('custom')
arch=('x86_64')
url="https://collab.cels.anl.gov/display/ESR/SZ"
depends=('zstd')
makedepends=('cmake')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('be94f3c8ab03d6849c59a98e0ebf80816a6b8d07a1d762a4b285498acb2f3871')

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

