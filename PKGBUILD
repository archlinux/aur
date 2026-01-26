# Maintainer: Ben Weeks <ben.weeks@outlook.com>
pkgname=upowertray
pkgver=1.1.3
pkgrel=1
pkgdesc="Lightweight battery tray indicator for Linux desktops (X11/Wayland)"
arch=('x86_64')
url="https://github.com/BenGWeeks/upowertray"
license=('MIT')
depends=('qt6-base' 'upower')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BenGWeeks/upowertray/archive/v$pkgver.tar.gz")
sha256sums=('2d49f722bf3d283bed21a3e6ee7f118335374825393031ae99327b0d8abb2960')

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
