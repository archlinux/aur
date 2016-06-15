# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=0.13
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'libcl' 'hwloc' 'libltdl' 'opencl-headers')
source=("http://pocl.sourceforge.net/downloads/$pkgname-$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('1892a6167bb5d48acaa79de4a9a76355c624e01a3bec31599947d6972eddcfd0b7523d61a3bd08018a30e34ab5a1b225a7ca2feaa2c2f6fcf03403fb887a6c0d')

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
  chmod +x "$pkgdir"/usr/bin/pocl-standalone
}
