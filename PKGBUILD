# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.22
pkgrel=2
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake ninja)
# gltfpack-bin in AUR
provides=(gltfpack)
conflicts=(gltfpack)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('e296cf0685b6421f84bd8a44d0a3cca82a219500f11c793dfbb6087ec86bb1a3')

build() {
    mkdir -p build && cd build
    cmake "$srcdir/meshoptimizer-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMESHOPT_BUILD_SHARED_LIBS=ON \
        -DMESHOPT_BUILD_GLTFPACK=ON \
        -G Ninja
  ninja
}

package() {
    cd build
    DESTDIR="$pkgdir" ninja install/strip
}
