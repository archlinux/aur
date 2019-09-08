# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
pkgname=shen-sbcl
pkgver=2.6.0
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
sha512sums=('acb4e7336f3e3a2e48ffc552bbcf05e59ff8a190849593a4777f98c348b577e77ce5b49ed0d58737612bfaabe650b7dc4ca39c3ef8fb4986d021358fbbeb5300')

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
