# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=task-manager
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple, lightweight, and powerful task manager for Linux. Inspired by the original taskmgr.exe"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/Linux-Task-Manager"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('28a8fd6a5580127e0f05c3c8084c1f46de3693e3e2c4a8ad67cd61921a590998')

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
