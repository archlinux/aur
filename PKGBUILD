pkgname=fmilib
pkgver=2.0.2
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('i686' 'x86_64')
url="http://www.jmodelica.org/FMILibrary"
depends=('minizip' 'expat')
license=('BSD')
source=("http://www.jmodelica.org/downloads/FMIL/FMILibrary-${pkgver}-src.zip")
sha1sums=('901de5765ebabb67a3b3b29eef20b6a26c80fc5c')

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
