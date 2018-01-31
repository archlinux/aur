# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit-python2
_pkgname=RDKit
pkgver=2017_09_3
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'python2-numpy' 'sqlite3' 'python2-cairocffi' 'python2-pillow')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz" "http://www.inchi-trust.org/download/104/INCHI-1-API.zip")
sha256sums=('6a4d9e9eb0ca06cbcdc20505f0c6ea0b1167b4dcdf7d1185871ba16ce701a5f4'
            'c187573c0f6a1fcd555393315383bd1f69563ee47bd43c898f17c473b7bb690a')
provides=('rdkit')
conflicts=('rdkit','rdkit-git')

build() {
  cd ${srcdir}
  mkdir build
  cp INCHI-1-API/INCHI_API/inchi_dll/* rdkit-Release_${pkgver}/External/INCHI-API/
  cd build
  cmake ../rdkit-Release_${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DRDK_BUILD_INCHI_SUPPORT=ON
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
