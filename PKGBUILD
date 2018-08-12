# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
pkgname=shen-sbcl
pkgver=2.3.0
pkgrel=2
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
sha512sums=('63e8de291c6b0779346a473e2dfc391f39440f88c5b1ff3c747a9573e1203691da7d327399b0de52776e94236d86a4480cdadf430783129e5c461be0df573666')

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
