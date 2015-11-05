# Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>

pkgname=flens-git
pkgver=1.1.0_33_g0f8dbe9
pkgrel=1
pkgdesc="FLENS - Flexible Library for Efficient Numerical Solutions - new headers only version."
arch=('i686' 'x86_64')
url="http://flens.sourceforge.net"
license=('BSD')
depends=()
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('flens')
conflicts=('flens')
source=("${pkgname}"::'git://github.com/michael-lehn/FLENS.git')
md5sums=('SKIP')

pkgver() {
   cd "${pkgname}"
   echo "$(git describe --tags | tail -c+2 | sed 's|-|_|g')" 
}

build() {
  cd "${pkgname}"
  mkdir $srcdir/$pkgname/build
  cd $srcdir/$pkgname/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/$pkgname/build
  make DESTDIR=$pkgdir install || return 1
}

