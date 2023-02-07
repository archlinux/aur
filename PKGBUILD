# Maintainer: cysp74 at gmail dot com
_name=pocl
pkgname="${_name}-git"
pkgver=3.1.RC1.r160.g8a4830d1
pkgrel=1
epoch=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets (git version)"
arch=('x86_64')
url="http://portablecl.org/"
license=('GPL')
depends=('clang' 'hwloc' 'opencl-icd-loader')
makedepends=('git' 'llvm' 'cmake' 'opencl-headers' 'ocl-icd')
provides=("${_name}=${pkgver}" "${_name}-git=${pkgver}")
conflicts=("${_name}")
source=("${_name}::git+https://github.com/pocl/pocl.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_name}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    "${srcdir}/${_name}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}"/ install
}
