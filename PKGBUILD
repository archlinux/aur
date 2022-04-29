# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=libptytty
pkgver=2.0
pkgrel=3
pkgdesc="libptytty is an offspring of rxvt-unicode that handles pty/tty/utmp/wtmp/lastlog handling in mostly OS-independent ways, so it's less of a hassle for you"
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/libptytty.html'
license=('GPL')
source=(http://dist.schmorp.de/$pkgname/$pkgname-$pkgver.tar.gz)
makedepends=('cmake')
sha1sums=('ed0605e23615559139ed8526e1bfaebaf9a95c43')
_dir="$pkgname-$pkgver"

prepare() {
    mkdir -p "$_dir/build"
}

build() {
    cd "$_dir/build"

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        ..
    cmake --build .
}

package() {
    cd "$_dir"

    install -Dm755 build/libptytty.so.0 "$pkgdir/usr/lib/libptytty.so.0"
    cp -d build/libptytty.so "$pkgdir/usr/lib/libptytty.so"

    install -Dm644 src/libptytty.h "$pkgdir/usr/include/libptytty.h"

    install -Dm644 doc/libptytty.3 "$pkgdir/usr/share/man/man3/libptytty.3"

    install -Dm644 build/libptytty.pc "$pkgdir/usr/lib/pkgconfig/libptytty.pc"
}
