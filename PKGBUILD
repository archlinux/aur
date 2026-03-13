# Maintainer: mmaher88 <narmer88@gmail.com>
pkgname=fcitx5-laren
pkgver=0.3.5
pkgrel=1
pkgdesc="Arabizi to Arabic transliteration engine for Fcitx5"
arch=('x86_64' 'aarch64')
url="https://github.com/mmaher88/laren"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt')
install=fcitx5-laren.install
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'fcitx5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2052d84861123f77390f3d0f0c748517bcdf2cb9474477e8f3bfb9d144b087fc')

build() {
    cmake -B build -S "laren-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=OFF
    cmake --build build
}

check() {
    cmake -B build-test -S "laren-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=ON
    cmake --build build-test
    cd build-test && ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
