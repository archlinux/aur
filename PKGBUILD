pkgname=fmilib
pkgver=3.0.2
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
license=('BSD')
makedepends=('cmake3-bin')
depends=('glibc')
options=(!lto)
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('4b6d2514c79f7e5875b12022a6455dfc999fb5905d973ab875c949362e0c9225')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}
}

build() {
  cd "$srcdir"/fmi-library-${pkgver}
  PATH=/opt/cmake3/bin:$PATH cmake -DCMAKE_INSTALL_PREFIX=/usr -DFMILIB_BUILD_TESTS=OFF -B build .
  make -C build
}

package() {
  cd "$srcdir"/fmi-library-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
