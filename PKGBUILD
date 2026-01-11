# Maintainer: Ben Weeks <ben.weeks@outlook.com>
pkgname=upowertray
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight battery tray indicator for KDE Plasma/Wayland"
arch=('x86_64')
url="https://github.com/BenGWeeks/upowertray"
license=('MIT')
depends=('qt6-base' 'upower')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BenGWeeks/upowertray/archive/v$pkgver.tar.gz")
sha256sums=('52ca1bc9decd1f70b9debe17c9639ad08739cd3dcbf8b7bc89e496389522ee6f')

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
