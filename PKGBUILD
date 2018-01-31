pkgname=vinecopulib
pkgver=0.2.5
pkgrel=1
pkgdesc="A C++ vine copula library"
license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/vinecopulib/vinecopulib"
depends=('boost')
makedepends=('cmake' 'eigen')
source=("https://github.com/vinecopulib/vinecopulib/archive/v${pkgver}.tar.gz")
sha256sums=('f9b9b66b2fc73214d6ab0db37bf226601c9de85c4d318248247a2931a0df08ec')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DVINECOPULIB_SHARED_LIB=ON ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
