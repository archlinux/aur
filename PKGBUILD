# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=arrayfire
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='http://arrayfire.com'
pkgver=3.1.2
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'freeimage' 'graphviz' 'doxygen' 'cuda' 'opencl-headers' 'glfw')
depends=('cblas' 'fftw' 'boost')
optdepends=('cuda: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend'
            'glfw: Required for running the examples')
source=(http://arrayfire.com/arrayfire_source/arrayfire-full-${pkgveR}.tar.bz2)
md5sums=('SKIP')

check() {
  cd "${srcdir}/build"

  make test
}

build() {
  cd "${srcdir}"

  rm -rf build
  mkdir build && cd build

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_CPU=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=ON \
      -DBUILD_TESTS=ON \
      -DBUILD_DOCS=ON

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
