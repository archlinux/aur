# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=task-manager
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple, lightweight, and powerful task manager for Linux. Inspired by the original taskmgr.exe"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/Linux-Task-Manager"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/V$pkgver.tar.gz")
sha256sums=('1971a9c1ff4d1d51c5a4294265f4f75cc28821c4d6ff873e0e9d4d462c70e57b')

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
