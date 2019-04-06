# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=1.3
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'libltdl' 'opencl-headers' 'opencl-icd-loader')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('8c4ea87c19ea044e752f50810aa5eb99090956d804533e13b4074846c1fecb28258f0e1ec67af62f255f321f53d2e8bf34a938be64c358410490b2565972a2a0')

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

# check() {
#   cd build
#   make test
# }

package() {
  cd build
  make DESTDIR="$pkgdir"/ install
}
