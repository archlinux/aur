# Maintainer: Samo Turk <samo.turk@gmail.com> 
pkgname=rdkit-git
_pkgname=RDKit
gitname=rdkit
pkgver=20150506
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python2' 'sqlite3' 'python2-numpy')
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}


package() {
  echo "Making package.."
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install 
}
