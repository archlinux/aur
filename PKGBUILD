# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-querystring
pkgver=9.1.0
pkgrel=2
_srcver=2.0.4
pkgdesc="QueryString module for Varnish Cache"
arch=('x86_64')
url="https://github.com/Dridi/libvmod-querystring"
license=('GPL-3.0-or-later')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('pkg-config' 'python-docutils')
source=("$pkgname-$_srcver.tar.gz::https://github.com/gquintard/vmod-querystring/releases/download/fix-9.1.0/vmod-querystring-${_srcver}.tar.gz")
sha512sums=('da554620a84e63080c65d71b406c380377695491936bf4ebb4f38380911add9af198d0f56170149a65c321a3344c47fdde18743c5143d2622ebd906a6b990759')

build() {
    cd "$pkgname-$_srcver"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "$pkgname-$_srcver"
    make check VERBOSE=1
}

package() {
    cd "$pkgname-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
