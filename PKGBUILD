# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-sedlex
pkgver=2.1
pkgrel=2
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/ocaml-community/sedlex'
depends=('ocaml' 'ocaml-gen' 'ocaml-ppx_tools')
source=("https://github.com/alainfrisch/sedlex/archive/v${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('7b4a66a74419a88a841370d7162243f834e0842c3ce984f2b0090f5f11ab1699<Paste>')

build() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    make all
    make opt
}

package() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
    export OCAMLFIND_DESTDIR="$DESTDIR"
    mkdir -p "$DESTDIR"

    make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
