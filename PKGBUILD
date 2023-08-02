# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.19
pkgrel=1
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake ninja)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('e334292ef29351387a79767e348f4bedb7645a0a9169be6bfa23bafa8ddc6ed4')

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
