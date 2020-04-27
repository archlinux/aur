# Maintainer: András Wacha <awacha@gmail.com>

pkgname=(python2-openbabel)
pkgver=3.0.0
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry: Python2 bindings"
arch=('i686' 'x86_64')
depends=('python2' 'openbabel' 'wxgtk' 'eigen' 'boost-libs' 'python-rapidjson' 'libxml2')
url="http://openbabel.org/wiki/Main_Page"
license=('GPL')

makedepends=('cmake' 'boost' 'swig')
source=("https://github.com/openbabel/openbabel/archive/openbabel-3-0-0.tar.gz")
md5sums=('4c0ba0ce5dac240b51dded72f69edbc0')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../openbabel-openbabel-3-0-0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DPYTHON_BINDINGS=ON \
    -DBINDINGS_ONLY=ON \
    -DRUN_SWIG=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}


package() {
  cd build/scripts
  make DESTDIR="$pkgdir" install
}
