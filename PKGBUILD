# Maintainer: mmaher88 <narmer88@gmail.com>
pkgname=fcitx5-laren
pkgver=0.1.0
pkgrel=1
pkgdesc="Arabizi to Arabic transliteration engine for Fcitx5"
arch=('x86_64' 'aarch64')
url="https://github.com/mmaher88/laren"
license=('GPL-3.0-or-later')
depends=('fcitx5')
makedepends=('cmake' 'extra-cmake-modules' 'fcitx5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c81f36d81e2d1830c48f68836334450f7e9a1c85fe222fb63207a09e0e4fb51')

build() {
    cmake -B build -S "laren-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=OFF
    cmake --build build
}

check() {
    cmake -B build -S "laren-$pkgver" -DBUILD_TESTS=ON
    cmake --build build
    cd build && ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
