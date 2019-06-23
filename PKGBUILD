# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-sedlex
pkgver=2.0
pkgrel=1
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/alainfrisch/sedlex'
depends=('ocaml' 'ocaml-gen' 'ocaml-ppx_tools')
source=("https://github.com/alainfrisch/sedlex/archive/v${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('58cd6d9fbc5e5b7717f3e56ef166853eb7a4ac0c3016db8f5ba71fe903510656')

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
