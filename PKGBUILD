# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=1.0
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'libltdl' 'opencl-headers' 'opencl-icd-loader')
source=("http://portablecl.org/downloads/$pkgname-$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('df4920a17025cb925040d336cc2d3e29d6783874f5fb387fff1774ef495399d0ee145005d600f492599cb12cfd8e5b3af41e59f62c551f30f161a2328d4060ed')

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir"/ install
}
