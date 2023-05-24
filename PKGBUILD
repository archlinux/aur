# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit-git
_pkgname=RDKit
gitname=rdkit
pkgver=20160107
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'sqlite3' 'python2-numpy' 'python2-cairocffi' 'python2-pillow')
makedepends=('git')
source=("https://www.inchi-trust.org/wp/download/106/INCHI-1-SRC.zip")
sha256sums=('4874e310c0f2f81b881e90dd0c534752e1b9421d7d92ccfb037710022c7e7efd')
provides=('rdkit')
conflicts=('rdkit','rdkit-git')
_gitroot="https://github.com/rdkit/rdkit.git" 
_gitname="rdkit"
_gitbranch="master"

build() {
  cd ${srcdir}
  mkdir build
  cd build
  git clone $_gitroot
  cp ../INCHI-1-API/INCHI_API/inchi_dll/* ${gitname}/External/INCHI-API/
  cmake ${gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DRDK_BUILD_INCHI_SUPPORT=ON \
    -DRDK_BUILD_THREADSAFE_SSS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DRDK_BUILD_INCHI_SUPPORT=ON
  make
}


package() {
  echo "Making package.."
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
