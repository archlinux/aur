# Maintainer: András Wacha <awacha@gmail.com>

pkgname=(python2-openbabel)
pkgver=2.4.1
pkgrel=4
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry: Python2 bindings"
arch=('i686' 'x86_64')
depends=('python2' 'openbabel')
url="http://openbabel.org/wiki/Main_Page"
license=('GPL')
makedepends=('cmake' 'eigen' 'wxgtk' 'boost' 'python2')
source=("http://downloads.sourceforge.net/openbabel/openbabel-${pkgver}.tar.gz")
md5sums=('d9defcd7830b0592fece4fe54a137b99')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../openbabel-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DPYTHON_BINDINGS=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
}


package() {
  cd build/scripts
  make DESTDIR="$pkgdir" install
}
