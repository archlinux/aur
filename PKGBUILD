# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=task-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, lightweight, and powerful task manager for Linux. Inspired by the original taskmgr.exe"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/Linux-Task-Manager"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/V$pkgver.tar.gz")
sha256sums=('99d90772c5d95c2ea39e13b902d9704c899c1ef42336daaf88bdbf2d3c3647aa')

build() {
    # It's cleaner to create a build directory
    cmake -B build -S "Linux-Task-Manager-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install the license file (mandatory if it's not a common system license)
    install -Dm644 "Linux-Task-Manager-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
