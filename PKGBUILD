# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>

pkgname=desktopforge
pkgver=0.1.0
pkgrel=2
pkgdesc="A small Qt6 GUI tool for creating and editing .desktop launcher files (the freedesktop.org Desktop Entry Specification), without hand-editing INI syntax in a text editor."
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/desktopfileforge"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/DesktopFileForge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f227ae1463bd97f8dd7a5b03a66d2ed9d690e946993e1897cfd8becd10008eb7')

build() {
    cd "DesktopFileForge-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    cd "DesktopFileForge-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
