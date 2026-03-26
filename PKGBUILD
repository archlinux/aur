# Maintainer: Codiak 540<Codiak540@bbs.4d2.org>
pkgname=task-manager
pkgver=4.0.0
pkgrel=1
pkgdesc="A simple, lightweight, and powerful task manager for Linux. Inspired by the original taskmgr.exe, Aims to have as much information (and control) relating to your system as possible."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Codiak540/Linux-Task-Manager"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee39c672547ccb47a69037082afa36e6db3d37eaa3d26a55d890d510f2f5ca8d')

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
