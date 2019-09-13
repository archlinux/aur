# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit
_pkgname=RDKit
pkgver=2019_03_4
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'python-numpy' 'sqlite3' 'python-cairocffi' 'python-pillow' 'inchi' 'eigen3' )
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('33c8eb5b3162296662ec06f8dd58e11fc21fa2ebcb13b456fcb3c4f3a39a357c')
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
