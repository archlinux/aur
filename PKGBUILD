pkgname=sz
pkgver=2.1.6.0
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets)"
license=('custom')
arch=('x86_64')
url="https://collab.cels.anl.gov/display/ESR/SZ"
depends=('zstd')
makedepends=('cmake')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('6718434f2a5c669ce6b9715e43b5bdfc0e4d498ce04fd848d6798bcccd822dad')

build() {
  cd SZ-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        .
  make
}

package() {
  cd SZ-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/include
}

