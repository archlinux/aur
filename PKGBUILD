# Maintainer: mmaher88 <narmer88@gmail.com>
pkgname=fcitx5-laren
pkgver=0.1.0
pkgrel=2
pkgdesc="Arabizi to Arabic transliteration engine for Fcitx5"
arch=('x86_64' 'aarch64')
url="https://github.com/mmaher88/laren"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fcitx5-configtool')
install=fcitx5-laren.install
optdepends=('fcitx5-gtk: GTK input module'
            'fcitx5-qt: Qt input module')
makedepends=('cmake' 'extra-cmake-modules' 'fcitx5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('562d8d4506cd56befa782e31264003fd0e0f3d1b89acdf08945d7908e30091eb')

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
