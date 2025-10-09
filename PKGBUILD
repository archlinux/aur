# Maintainer: crl <crl18039102576@126.com>

pkgname=rapids-logger
pkgver=0.2.3
pkgrel=1
pkgdesc="A logging interface for RAPIDS built on spdlog"
url="https://github.com/rapidsai/rapids-logger"
arch=('x86_64')
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cmake' 'gcc' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36578b337993cdbc7f4c52e5d871289628ac408f3a6028ab4e73a64fcdaa9412')


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
