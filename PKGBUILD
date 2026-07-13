# Maintainer: T9Tuco <tucot9@tuta.io>
pkgname=usbunker
pkgver=1.0.3
pkgrel=1
pkgdesc="Encrypt and decrypt USB drives with AES-256-GCM"
arch=('x86_64')
url="https://github.com/T9Tuco/USBunker"
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'openssl')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/T9Tuco/USBunker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "USBunker-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "USBunker-$pkgver/resources/linux/usbunker.desktop" \
        "$pkgdir/usr/share/applications/usbunker.desktop"
    install -Dm644 "USBunker-$pkgver/resources/icons/shield.svg" \
        "$pkgdir/usr/share/pixmaps/usbunker.svg"
}
