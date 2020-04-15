# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit-python2
_pkgname=RDKit
pkgver=2018_09_3
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'python2-numpy' 'sqlite3' 'python2-cairo' 'python2-pillow' 'eigen3')
source=("https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz")
sha256sums=('3be20bade43657c0d74617ab99ca30f872eaaedc314a87f690ac38e5ef590224')
provides=('rdkit')
conflicts=('rdkit' 'rdkit-git')

build() {
  cd ${srcdir}/rdkit-Release_${pkgver} 
    cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DRDK_BUILD_INCHI_SUPPORT=OFF
  make
}

package() {
  cd ${srcdir}/rdkit-Release_${pkgver}
  make DESTDIR=${pkgdir} install
}
