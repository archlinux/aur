# Maintainer: Guillaume Quintard <guillaume.quintard@gmail.com>

pkgname=varnish-modules
pkgver=0.21.0
pkgrel=2
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=7.2.1')
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

sha512sums=('a442f58968b471d713c99a94e5b80302c07ea163d3d5022d768eb0b39ab081f18744fd529b04283b0c6ec942f362197935d8ef1aa04f26eff10a81425a63bd35')
