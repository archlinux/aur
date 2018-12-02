pkgname=fmilib
pkgver=2.0.3
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('i686' 'x86_64')
url="http://www.jmodelica.org/FMILibrary"
makedepends=('cmake')
depends=('minizip' 'expat')
license=('BSD')
source=("https://jmodelica.org/FMILibrary/FMILibrary-${pkgver}-src.zip")
sha256sums=('4cc21f9e2c4114a6f4e303f82ca897ec9aa1eb6f7f09fef85979ea5fca309d9a')

prepare() {
  cd "$srcdir"/FMILibrary-${pkgver}

  # do not override CMAKE_INSTALL_PREFIX
  sed -i "/CMAKE_INSTALL_PREFIX/d" CMakeLists.txt

  # install doc in /usr/share
  sed -i "s|DESTINATION doc)|DESTINATION share/doc/fmilib)|g" CMakeLists.txt
}

build() {
  cd "$srcdir"/FMILibrary-${pkgver}
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir"/FMILibrary-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
