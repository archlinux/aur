# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-gen
pkgver=0.5.3
pkgrel=1
pkgdesc='Iterators for OCaml'
license=('BSD')
arch=('i686' 'x86_64')
url='https://github.com/c-cube/gen/'
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/c-cube/gen/archive/${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('160352ce6d678ed7095caf5b3fd3708b155f8b224cf8bad99054946422b8d4cb')

build() {
    cd "${pkgname/ocaml-/}-$pkgver"

    dune build --release
}

package() {
    cd "${pkgname/ocaml-/}-$pkgver"

    PREFIX="$pkgdir$(ocamlfind printconf destdir)"

    dune install --prefix="$PREFIX" --libdir="$PREFIX"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
