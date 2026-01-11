# Maintainer: Ben Weeks <ben.weeks@outlook.com>
pkgname=upowertray
pkgver=1.1.2
pkgrel=1
pkgdesc="Lightweight battery tray indicator for Linux desktops (X11/Wayland)"
arch=('x86_64')
url="https://github.com/BenGWeeks/upowertray"
license=('MIT')
depends=('qt6-base' 'upower')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BenGWeeks/upowertray/archive/v$pkgver.tar.gz")
sha256sums=('d5cf859cb2233c316d5faed7b19da888c684628d706c8ffcbee3b4e776f2badd')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
