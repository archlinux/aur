# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit-git-python3
_pkgname=RDKit
gitname=rdkit
pkgver=20161007
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'sqlite3' 'python-numpy' 'python-cairocffi' 'python-pillow')
makedepends=('git')
source=("http://www.inchi-trust.org/download/104/INCHI-1-API.zip")
md5sums=('8447bf108af12fe66eecba41bbc89918')
provides=('rdkit')
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
    -DRDK_BUILD_THREADSAFE_SSS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python3.5/config-3.5m/libpython3.5m.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.5m/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  make
}


package() {
  echo "Making package.."
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
