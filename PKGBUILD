# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=kernelforge
pkgver=0.1.2
pkgrel=1
pkgdesc="Cross-distro Linux Kernel Manager with Qt6 GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/kernelforge"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95fe7dbf2d3131741293ef2e13be12f257bd8de4808bcb3f53b421ba00475807')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
