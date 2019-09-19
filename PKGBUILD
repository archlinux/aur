# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
pkgname=shen-sbcl
pkgver=2.6.1
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
sha512sums=('55c82d2b62579b666cfde4ef88009bb0b05f2f2b9f5c76ee5944dfc38403c6cd1405453b13b8d54e55c162c6e42198f344677e2c5419924fde23e5d5c1db259c')

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
