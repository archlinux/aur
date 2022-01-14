# Maintainer: database64128 <free122448@hotmail.com>
pkgname=uvw-git
pkgver=2.11.0_libuv_v1.43.r0.g86fb93d
pkgrel=1
pkgdesc="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
arch=(x86_64)
url="https://github.com/skypjack/uvw"
license=('MIT')
depends=('libuv')
makedepends=('cmake')
provides=('uvw')
conflicts=('uvw')
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "$pkgname" -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCH_LIBUV=OFF \
        -DUSE_LIBCPP=OFF
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/uvw/LICENSE"
}
