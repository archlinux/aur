# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
_pkgname=RDKit
pkgver=2017_03_1
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'python-numpy' 'sqlite3' 'python-cairocffi' 'python-pillow')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz" "http://www.inchi-trust.org/download/104/INCHI-1-API.zip")
md5sums=('e0ae4f922cc60cae1cf891bd0aadbaa5' '8447bf108af12fe66eecba41bbc89918')
provides=('rdkit')
conflicts=('rdkit','rdkit-git')

build() {
  cd ${srcdir}
  mkdir build
  cp INCHI-1-API/INCHI_API/inchi_dll/* ${pkgname}-Release_${pkgver}/External/INCHI-API/
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
