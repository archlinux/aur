# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
_pkgname=RDKit
pkgver=2015_09_2
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'python2-numpy' 'sqlite3' )
source=(https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz )
md5sums=('889fc8bda9d59ce3b72bf6252c630287')
provides=('rdkit')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-Release_${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
