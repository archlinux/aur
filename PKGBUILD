# Maintainer: T9Tuco <tucot9@tuta.io>
pkgname=usbunker-git
pkgver=r15.892be56
pkgrel=1
pkgdesc="Encrypt and decrypt USB drives with AES-256-GCM"
arch=('x86_64')
url="https://github.com/T9Tuco/USBunker"
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'openssl')
makedepends=('cmake' 'gcc' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/resources/linux/usbunker.desktop" \
        "$pkgdir/usr/share/applications/usbunker.desktop"
    install -Dm644 "$pkgname/resources/icons/shield.svg" \
        "$pkgdir/usr/share/pixmaps/usbunker.svg"
}
