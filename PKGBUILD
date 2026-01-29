# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>
# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.6.1.3
pkgrel=1
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/alemart/opensurge"
license=('GPL-3.0-or-later')
depends=('glibc' 'allegro' 'surgescript' 'physfs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('be0f751a8d0910556380910fcc9ae2a219d7cc74dd2493b396af8edf5b3666a9')

build() {
    cd $pkgname-$pkgver

    mkdir -p build

    cmake -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DGAME_BINDIR="/usr/bin" \
        -S . -B build

    cmake --build build
}

package() {
    cd $pkgname-$pkgver

    DESTDIR="$pkgdir" cmake --install build
}
