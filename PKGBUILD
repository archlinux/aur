pkgname=fmilib
pkgver=3.0.4
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="https://github.com/modelon-community/fmi-library"
license=('BSD')
makedepends=('cmake')
depends=('glibc' 'expat' 'minizip')
options=(!lto)
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('99bb1381f67fbc521faf8229ddeb9ae47aaa9d764989dcbc9af296ec565cd34f')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}
}

build() {
  cd "$srcdir"/fmi-library-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DFMILIB_BUILD_STATIC_LIB=OFF -DFMILIB_BUILD_TESTS=OFF -DFMILIB_EXTERNAL_LIBS=ON -B build .
  make -C build
}

package() {
  cd "$srcdir"/fmi-library-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
