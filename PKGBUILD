# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
pkgname=shen-sbcl
pkgver=2.4.0
pkgrel=1
epoch=1
pkgdesc="A portable functional programming language (SBCL port)"
arch=('x86_64')
url="http://www.shenlanguage.org/"
license=('BSD')
depends=('zlib')
makedepends=('sbcl')
provides=('shen')
options=(!strip)
source=(https://github.com/Shen-Language/shen-cl/archive/v$pkgver.tar.gz)
sha512sums=('eee1e70476a88a2bf7c0173c45fdd54752b780180c7498d851317c91e5e57a7e0a7e5d10f9521f3ae178f5dbba0a641baaa96d3bcdf72fe9970af8454360bcca')

build() {
    cd "$srcdir/shen-cl-$pkgver"
    make fetch
    make build-sbcl
}

check() {
    cd "$srcdir/shen-cl-$pkgver"
    make test-sbcl
}

package() {
    cd "$srcdir/shen-cl-$pkgver"

    # binary
    install -Dm755 "bin/sbcl/shen" "$pkgdir/usr/bin/shen"

    # documentation
    install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a kernel/doc/*.md "$pkgdir/usr/share/doc/$pkgname"

    # license
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
