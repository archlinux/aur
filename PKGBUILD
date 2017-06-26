# Maintainer: Felix Igelbrink <felix.igelbrink@uos.de>
pkgname=libnabo-git
_pkgname=libnabo
pkgver=1.0.6.r37.g9c0e1c2
pkgrel=1
pkgdesc="A fast K Nearest Neighbor library for low-dimensional spaces"
url="https://github.com/ethz-asl/libnabo"
depends=('eigen' 'boost' 'boost-libs')
makedepends=('git')
provides=('libnabo')
conflicts=('libnabo')
arch=('i686' 'x86_64')
license=('BSD')
source=("git+https://github.com/ethz-asl/libnabo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Wno-dev \
    ../libnabo
  make 
}

package()
{
  cd "$srcdir/build"
  make DESTDIR=$pkgdir install
}