# Maintainer: András Wacha <awacha@gmail.com>

pkgname=(python2-openbabel)
pkgver=3.1.1
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry: Python2 bindings"
arch=('i686' 'x86_64')
depends=('python2' 'openbabel' 'wxgtk3' 'eigen' 'boost-libs' 'rapidjson' 'python-rapidjson' 'libxml2' 'cairo' 'boost')
url="http://openbabel.org/wiki/Main_Page"
license=('GPL')

makedepends=('cmake' 'boost' 'swig')
source=("https://github.com/openbabel/openbabel/archive/refs/tags/openbabel-${pkgver//./-}.tar.gz")
md5sums=('7efb864d2ba5593b286ddc49d70aa851')
sha256sums=('c97023ac6300d26176c97d4ef39957f06e68848d64f1a04b0b284ccff2744f02')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../openbabel-openbabel-${pkgver//./-} \
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
