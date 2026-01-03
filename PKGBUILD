# Maintainer: Your Name <your.email@example.com>
pkgname=kdedimmer
pkgver=1.0.0
pkgrel=1
pkgdesc="Click-through screen dimmer overlay for KDE Plasma Wayland"
arch=('x86_64')
url="https://github.com/Ekats/kdedimmer"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'wayland')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a33dce81d8f831208c9b03a1c2e4a86801e17bc8491c68f7502520c21308a907')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/kdedimmer "$pkgdir/usr/bin/kdedimmer"
    install -Dm644 kdedimmer.service "$pkgdir/usr/lib/systemd/user/kdedimmer.service"
}
