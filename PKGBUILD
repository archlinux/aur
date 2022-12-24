# Maintainer: cysp74 at gmail dot com

pkgname=pocl-git
_pkgname=pocl
pkgver=1.4.RC2.r59.g3b4829d6
pkgrel=1
epoch=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets (git version)"
arch=('x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'opencl-icd-loader')
makedepends=('git' 'llvm' 'cmake' 'opencl-headers' 'ocl-icd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/pocl/pocl.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    "$srcdir/$_pkgname"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir"/ install
}
