# Maintainer: Your Name <your.email@example.com>
pkgname=kdedimmer
pkgver=1.1.0
pkgrel=1
pkgdesc="Click-through screen dimmer overlay for KDE Plasma Wayland"
arch=('x86_64')
url="https://github.com/Ekats/kdedimmer"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'wayland' 'kstatusnotifieritem')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('163e4f0a1d5353c042cc81642af558d7f2e7ebb26b3d0506ba45d9133e3f49aa')

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
