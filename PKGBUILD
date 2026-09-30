# Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
pkgname=omarchy-screenshot
pkgver=0.1.4
pkgrel=1
pkgdesc="Qt 6 screenshot and annotation tool for Omarchy and Hyprland"
arch=('x86_64')
url="https://github.com/manateelazycat/omarchy-screenshot"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'layer-shell-qt' 'grim' 'wl-clipboard' 'hyprland')
makedepends=('cmake')
optdepends=('tesseract: OCR text recognition' 'tesseract-data-chi_sim: Chinese OCR')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2ced329cd8d8297a669f0d3f8a96f6bc23e5626b5b3c8e76cdc83d43c3fb86ae')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
