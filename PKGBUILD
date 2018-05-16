# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
_pkgname=RDKit
pkgver=2018_03_1
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'python-numpy' 'sqlite3' 'python-cairocffi' 'python-pillow')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz" "http://www.inchi-trust.org/download/105/INCHI-1-SRC.zip")
sha256sums=('9edac0f57c963947b59dfe6f5a84cf3bd2d93ca7111d4d3cf883c9c61756905d'
            '4ac311ca3a16fa75d695ec4fc711e74045c6d6c882dea0dd1055961fba643720')
conflicts=('rdkit-python2','rdkit-git')

build() {
  cd ${srcdir}
  mkdir build
  mkdir -p rdkit-Release_${pkgver}/External/INCHI-API/src
  cp -a INCHI-1-SRC/* rdkit-Release_${pkgver}/External/INCHI-API/src
  cd build
  cmake ../${pkgname}-Release_${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.6m.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DRDK_BUILD_INCHI_SUPPORT=ON
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
