# Maintainer: Guillaume Quintard <guillaume.quintard@gmail.com>

pkgname=varnish-modules
pkgver=0.26.0
pkgrel=3
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=7.7.3-1')
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

sha512sums=('2050ec65ae731bddc74743c9aa6246e41ffba8017c404c32e50d45f72f5a02dd3eb2290f8b8e43e25a385a06819836fb19f8540f1cdae394083729ff6b6aed35')
