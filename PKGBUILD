# Maintainer: T9Tuco <tucot9@tuta.io>
pkgname=archvital
pkgver=1.3.0
pkgrel=1
pkgdesc="Qt6/C++20 system monitor for Arch Linux"
arch=('x86_64')
url="https://github.com/T9Tuco/archvital"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/T9Tuco/archvital/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/archvital.desktop" \
        "$pkgdir/usr/share/applications/archvital.desktop"
    install -Dm644 "$pkgname-$pkgver/assets/archvital.svg" \
        "$pkgdir/usr/share/pixmaps/archvital.svg"
}
