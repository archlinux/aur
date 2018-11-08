pkgname=zfp
pkgver=0.5.4
pkgrel=1
pkgdesc="Library for compressed numerical array"
arch=('x86_64')
url="https://computation.llnl.gov/projects/floating-point-compression"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/LLNL/zfp/releases/download/$pkgver/zfp-$pkgver.tar.gz")
sha256sums=('746e17aaa401c67dcffd273d6e6f95c76adfbbd5cf523dcad56d09e9d3b71196')

build() {
  cd "$srcdir/zfp-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
  make
}

check() {
  cd "$srcdir/zfp-$pkgver/build"
  ctest --output-on-failure
}

package() {
  cd "$srcdir/zfp-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

