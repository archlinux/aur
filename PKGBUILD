# Maintainer:  Markus Näther <markus.naether@gmail.com>
pkgname=cppflow
pkgver=2.0.0
pkgrel=1
pkgdesc="Run TensorFlow models in C++ without installation and without Bazel"
arch=('x86_64')
url="https://github.com/serizba/cppflow"
license=('MIT')
provides=('cppflow')
depends=('tensorflow')
makedepends=('cmake')
source=(https://github.com/serizba/cppflow/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('3d29ff93789657bd1e8d49e5ea1dc27c')

build() {
    _CMAKE_FLAGS+=( -Dtensorflow_INCLUDE_DIRS=/usr/include/tensorflow )
	cmake -G Ninja -S "$srcdir/cppflow-$pkgver" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "${_CMAKE_FLAGS[@]}"
    
    ninja -C "$srcdir/build" ${MAKEFLAGS:--j $(nproc)}
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
