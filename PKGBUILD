# Maintainer: database64128 <free122448@hotmail.com>
pkgname=uvw
pkgver=2.11.0_libuv_v1.43
pkgrel=1
pkgdesc="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
arch=(x86_64)
url="https://github.com/skypjack/uvw"
license=('MIT')
depends=('libuv')
makedepends=('cmake')
source=("https://github.com/skypjack/uvw/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5353242be72cdbee346fc0c6cb24aebd7c653c062b9b51c36f70bcad3600e41814557e9729461eea733d05da2805004bb880f826f1504c0586fc239227682108')

build() {
    cmake -S "$pkgname-$pkgver" -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCH_LIBUV=OFF \
        -DUSE_LIBCPP=OFF
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/uvw/LICENSE"
}
