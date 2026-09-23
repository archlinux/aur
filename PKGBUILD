# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-digest
pkgver=9.1.0
pkgrel=2
_srcver=1.1.1
pkgdesc="Varnish Module for computing HMAC, message digests and working with base64"
arch=('x86_64')
url="https://github.com/varnish/libvmod-digest"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'mhash')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-digest-libvmod-digest-$_srcver.tar.gz::https://github.com/varnish/libvmod-digest/archive/refs/tags/libvmod-digest-${_srcver}.tar.gz")
sha512sums=('57c876da9035a067d7e5ccca9417ecbbef3ea640525bbaf9f5d8a0bc4f7feb7a0d448e11bb52714da73415fa6380e26bbee7ca6ba3a60812aba73054122d8589')

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
