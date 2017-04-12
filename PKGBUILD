# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=0.14
pkgrel=2
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'libltdl' 'opencl-headers' 'opencl-icd-loader')
source=("http://pocl.sourceforge.net/downloads/$pkgname-$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('36bf41222315e13bac6c37cc942b9c09e22af0374abf63052fa8deb1ffe383da0ed9b5dc3548844d52749642d0b1288af5e0128e8dd4deb38e70128adb28c066')

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib -D_libdir_set=false \
    -DCMAKE_BUILD_TYPE=Release \
    -DEXTRA_KERNEL_CXX_FLAGS='-std=c++11' \
    "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir"/ install
}
