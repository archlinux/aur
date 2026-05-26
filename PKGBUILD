# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-digest
pkgver=9.0.3
pkgrel=2
_srcver=1.0.3
pkgdesc="Varnish Module for computing HMAC, message digests and working with base64"
arch=('x86_64')
url="https://github.com/varnish/libvmod-digest"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'mhash')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-digest-libvmod-digest-$_srcver.tar.gz::https://github.com/varnish/libvmod-digest/archive/refs/tags/libvmod-digest-${_srcver}.tar.gz")
sha512sums=('352c91613e51e98a034f04382e42b52992c4bb88d26cb38d7577a0523acbd6de549898ff159c67e9f2aeeb60a5b9025bd2b34c67da9ef3de5af95bfaa7b0cb58')

build() {
    cd "libvmod-digest-libvmod-digest-$_srcver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-digest-libvmod-digest-$_srcver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-digest-libvmod-digest-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
