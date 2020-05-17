# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.14
pkgrel=2
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake ninja)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('5a6e429ecf72325131b439a46297a690f0cab833c7563efdadab26c0a6cf8490')

build() {
    mkdir -p build && cd build
    # TODO: remove BUILD_SHARED_LIBS and CMAKE_DISABLE_FIND_PACKAGE_glfw3 for
    #   0.15, replace MESHOPT_BUILD_TOOLS with MESHOPT_BUILD_GLTFPACK
    cmake "$srcdir/meshoptimizer-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMESHOPT_BUILD_SHARED_LIBS=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DMESHOPT_BUILD_TOOLS=ON \
        -DCMAKE_DISABLE_FIND_PACKAGE_glfw3=ON \
        -G Ninja
  ninja
}

package() {
    cd build
    DESTDIR="$pkgdir" ninja install
}
