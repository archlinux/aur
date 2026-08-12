# Maintainer: crl <crl18039102576@126.com>

pkgname=rapids-logger
pkgver=0.3.0
pkgrel=1
pkgdesc="A logging interface for RAPIDS built on spdlog"
url="https://github.com/rapidsai/rapids-logger"
arch=('x86_64')
license=('Apache-2.0')
depends=(libgcc libstdc++)
makedepends=('cmake' 'gcc' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a0337f5de85680f82ffd1e2b72a3089c3dafd99a3d4c3bd11a2fbaa6dd1dd81b')


build() {
    cd "$srcdir/rapids-logger-$pkgver"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -G Ninja
    cmake --build build
}

package() {
    cd "$srcdir/rapids-logger-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
