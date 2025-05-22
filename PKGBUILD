pkgname=fmilib
pkgver=3.0.3
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
license=('BSD')
makedepends=('cmake3-bin')
depends=('glibc')
options=(!lto)
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('1acffcd157c2901c5bbccfc848425de0c661eacea24475aff842ef3ba7fb05a6')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}
}

build() {
  cd "$srcdir"/fmi-library-${pkgver}
  PATH=/opt/cmake3/bin:$PATH cmake -DCMAKE_INSTALL_PREFIX=/usr -DFMILIB_BUILD_STATIC_LIB=OFF -DFMILIB_BUILD_TESTS=OFF -B build .
  make -C build
}

package() {
  cd "$srcdir"/fmi-library-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
