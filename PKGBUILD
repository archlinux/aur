# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

pkgname=pocl
pkgver=1.4
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=('i686' 'x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'libltdl' 'opencl-headers' 'opencl-icd-loader')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('cmake' 'llvm' 'ocl-icd')
sha512sums=('ef4911638c76d988c120b69a991e54773a6b8bde49433c2e0f1703c374fa65a4fa64ebcaec94569863458032c17d8cb9879dc501b7e3a43b2c24524bce1b6098')

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
