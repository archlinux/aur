# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.18
pkgrel=2
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake ninja)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz"
        "no-error.patch")
sha256sums=('f5bc07d7322e6292fe0afce03462b5c394d111386236f926fdc44d2aff3b854b'
            '2ab7614fed032a45ad3b9038b736bb7617c8c564d943b39f3b4c5fa26a4e4db1')

prepare() {
    cd "$srcdir/meshoptimizer-$pkgver"
    patch -p1 < $srcdir/no-error.patch
}

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
