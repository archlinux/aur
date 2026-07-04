# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=deforge
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-distro GUI tool for managing Linux desktop environments (DEs): installing, safely removing, snapshotting/restoring configuration, and (eventually) running parallel DE versions via container isolation."
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/deforge"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ded0202c5d4229cb98a82f91153b9d6bc23d0ec7b00df773ea7db11b4e3889fa')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel $(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
