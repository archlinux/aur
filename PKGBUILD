# Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>

pkgname=cppqed-git
pkgver=1374.66ae6d3
pkgrel=3
pkgdesc="C++QED is a highly flexible framework for simulating open quantum dynamics."
arch=('i686' 'x86_64')
url="http://cppqed.sourceforge.net"
license=('BSL')
depends=('gcc-libs' 'boost' 'blitz-cppqed-hg' 'flens-git' 'python2' 'python2-numpy' 'python2-scipy' 'cmake', 'gsl')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('cppqed')
conflicts=('cppqed')
source=("${pkgname}"::'git://git.code.sf.net/p/cppqed/cppqed#branch=Development')
md5sums=('SKIP')

pkgver() {
   cd "${pkgname}"
   echo "$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
  cd "${pkgname}"
  mkdir $srcdir/$pkgname/build_release
  cd $srcdir/$pkgname/build_release
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DREGISTRY=Off ..
  make
}

package() {
  cd $srcdir/$pkgname/build_release
  make DESTDIR=$pkgdir install || return 1
}


