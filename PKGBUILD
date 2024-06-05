# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=libnetconf2
pkgver=3.0.17
pkgrel=1
pkgdesc='A NETCONF library in C intended for building NETCONF clients and servers.'
url='https://github.com/CESNET/libnetconf2'
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
depends=('libssh' 'libyang' 'openssl' 'libxcrypt')
makedepends=('cmake' 'doxygen')
conflicts=('libnetconf2-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CESNET/libnetconf2/archive/v$pkgver.tar.gz")
sha256sums=('ff57fe659db3c43d11f14c76bcc1f9e99aac4883a9966a623998175b2983cafd')

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
