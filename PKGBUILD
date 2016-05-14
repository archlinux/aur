pkgname=fmilib
pkgver=2.0.1
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('i686' 'x86_64')
url="http://www.jmodelica.org/FMILibrary"
depends=('glibc')
license=('BSD')
source=("http://www.jmodelica.org/downloads/FMIL/FMILibrary-${pkgver}-src.zip")
sha1sums=('975b23233e8eeba39eb503a429f8d74069cbcb3d')

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
