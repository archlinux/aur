# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.14
pkgrel=1
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake ninja)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('5a6e429ecf72325131b439a46297a690f0cab833c7563efdadab26c0a6cf8490')

build() {
    mkdir -p build && cd build
    cmake "$srcdir/meshoptimizer-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMESHOPT_BUILD_SHARED_LIBS=ON \
        -DBUILD_SHARED_LIBS=ON \
        -G Ninja
  ninja
}

package() {
    cd build
    DESTDIR="$pkgdir" ninja install
}
