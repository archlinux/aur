# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=libnetconf2
pkgver=1.1.26
pkgrel=1
pkgdesc='A NETCONF library in C intended for building NETCONF clients and servers.'
url='https://github.com/CESNET/libnetconf2'
arch=('x86_64' 'i686')
license=('BSD')
depends=('libssh' 'libyang' 'openssl' 'libxcrypt')
makedepends=('cmake' 'doxygen')
conflicts=('libnetconf2-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CESNET/libnetconf2/archive/v$pkgver.tar.gz")
sha256sums=('2ce2b819f3544fd46a3a4c8ba6dd0a3798cab2a63aa347bc1eb5275a2c89b7bd')

prepare() {
    mkdir -p "build"
}

build() {
    cd "build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        "../$pkgname-$pkgver"
    make
}

package() {
    cd "build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "../$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
