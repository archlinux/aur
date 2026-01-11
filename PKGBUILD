# Maintainer: Ben Weeks <ben.weeks@outlook.com>
pkgname=upowertray
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight battery tray indicator for KDE Plasma/Wayland"
arch=('x86_64')
url="https://github.com/BenGWeeks/upowertray"
license=('MIT')
depends=('qt6-base' 'upower')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BenGWeeks/upowertray/archive/v$pkgver.tar.gz")
sha256sums=('3d906b7a3a04d869301f5246016da965348a23cee52427a14ead1225d9987863')

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
