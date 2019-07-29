pkgname=sz
pkgver=2.1.5.3
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets)"
license=('custom')
arch=('x86_64')
url="https://collab.cels.anl.gov/display/ESR/SZ"
depends=('zstd')
makedepends=('cmake')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('d73e024da2095612c27a815fd6eb31cca24f566c9cdd6add74eabc08bba7d70d')

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

