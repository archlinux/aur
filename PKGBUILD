# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
_pkgname=RDKit
pkgver=2019_09_1
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'python-numpy' 'sqlite3' 'python-cairocffi' 'python-pillow' 'eigen3' )
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('bfcb3c094cd0e7ec6fbebacde71f29f61df71601eb3d577eb295fd45771513eb')
conflicts=('rdkit-python2' 'rdkit-git')

build() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DRDK_BUILD_INCHI_SUPPORT=OFF
  make
}

package() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}
  make DESTDIR=${pkgdir} install 
}
