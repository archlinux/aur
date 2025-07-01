# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>
# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=opensurge
pkgver=0.6.1.2
pkgrel=2
pkgdesc='Open Surge is a fun 2D retro platformer inspired by Sonic games, and a game creation system.'
arch=('i686' 'x86_64' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/alemart/opensurge"
license=('GPL-3.0-or-later')
depends=('glibc' 'allegro' 'surgescript' 'physfs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('097887beb232d40c3461eb7e9f03c6c6042187284aba8ec2749e11178c992329')

build() {
    cd $pkgname-$pkgver

    mkdir -p build

    cmake -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DGAME_BINDIR="/usr/bin" \
        -S . -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=4.0

    cmake --build build
}

package() {
    cd $pkgname-$pkgver

    DESTDIR="$pkgdir" cmake --install build
}
