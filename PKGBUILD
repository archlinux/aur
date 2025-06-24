# Maintainer: crl <crl18039102576@126.com>

pkgname=rapids-logger
pkgver=0.1.0
pkgrel=1
pkgdesc="A logging interface for RAPIDS built on spdlog"
url="https://github.com/rapidsai/rapids-logger"
arch=('x86_64')
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cmake' 'gcc' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('682c746c8afb571d133ab7717847dcde067c8183ac68aa20f8390f96cb7bbd7c')


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
