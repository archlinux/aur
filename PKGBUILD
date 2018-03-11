# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=1.1
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'libltdl' 'opencl-headers' 'opencl-icd-loader')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('f785d1a8bbceab86ae220c0c78dc81fc292333ac30bc02cf627aca02d9efc9f659d97c26c227e7ba66fa56d8abdcb23df2d100e5bc4d5c670c48646edefa19af')

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

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir"/ install
}
