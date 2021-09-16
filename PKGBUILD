# Maintainer: Guillaume Quintard <guillaume.quintard@gmail.com>

pkgname=varnish-modules
pkgver=0.19.0
pkgrel=1
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=7.0.0')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'python' 'python-docutils')
arch=('x86_64')
url="https://github.com/varnish/varnish-modules"
source=("$pkgname-$pkgver.tar.gz::https://github.com/varnish/varnish-modules/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
license=('BSD')

build() {
    cd "$pkgname-$pkgver"
    ./configure \
        --build="$CBUILD" \
        --host="$CHOST" \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --localstatedir=/var/lib
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check -k VERBOSE=1
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('fc6f4c1695f80fa3b267c13c772dca9cf577eed38c733207cf0f8e01b5d4ebabbe43e936974ba70338a663a45624254759cfd75f8fbae0202361238ee5f15cef')
