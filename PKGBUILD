# Maintainer: Guillaume Quintard <guillaume.quintard@gmail.com>

pkgname=varnish-modules
pkgver=0.23.0
pkgrel=1
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=7.4.1')
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

sha512sums=('913cba864261141cd38bae258960699b29e89e4a67025397b92a37d2677872305738a78bb14fe245517da3fd987613e68a41481e968565dd6da1ee2d85eca726')
