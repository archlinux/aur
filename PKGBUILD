# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Daniel Peukert <dan.peukert@gmail.com>
pkgname=ocaml-sedlex
pkgver=2.5
pkgrel=1
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/ocaml-community/sedlex'
depends=('ocaml>=4.04'
         'ocaml-gen'
         'ocaml-ppxlib>=0.18.0'
         'ocaml-uchar')
makedepends=('dune>=1.8.0')
source=("https://github.com/alainfrisch/sedlex/archive/v${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('5b98dcf6db145c7749709858443f3d997fe4670c14be05831577cc0b0da038a5')

build() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    make build
}

check() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    make test
}

package() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    DESTDIR="$pkgdir" dune install --prefix /usr --libdir lib/ocaml --release

    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    mv "$pkgdir/usr/doc/sedlex/"* "$pkgdir/usr/share/doc/$pkgname/"
    rm -r "$pkgdir/usr/doc/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -sf "$pkgdir/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
