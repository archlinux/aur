# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-sedlex
pkgver=1.99.3
pkgrel=1
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/alainfrisch/sedlex'
depends=('ocaml' 'ocaml-gen' 'ocaml-ppx_tools')
source=("https://github.com/alainfrisch/sedlex/archive/v${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('54a1c32e5505dc081b3f231f21501ebebddcd50ee097e9c163ba347855b953fb')

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
