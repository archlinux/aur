# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit-git
_pkgname=RDKit
gitname=rdkit
pkgver=20150928
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'sqlite3' 'python-numpy')
makedepends=('git')
source=()
md5sums=()
provides=('rdkit')
_gitroot="https://github.com/rdkit/rdkit.git" 
_gitname="rdkit"
_gitbranch="master"

build() {
  cd ${srcdir}
  mkdir build
  cd build
  git clone $_gitroot
  cmake ../build/${gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DRDK_BUILD_THREADSAFE_SSS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python3.4/config-3.4m/libpython3.4m.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.4m/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  make
}


package() {
  echo "Making package.."
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
