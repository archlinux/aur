# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-gen
pkgver=0.5.2
pkgrel=2
pkgdesc='Iterators for OCaml'
license=('BSD')
arch=('i686' 'x86_64')
url='https://github.com/c-cube/gen/'
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/c-cube/gen/archive/${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('8246738ca19810192f005b6e350605aae5132a6a55848795ee1fa002addf1b06')

build() {
    cd "${pkgname/ocaml-/}-$pkgver"

    # TODO: Remove once gen supports building with dune. jbuilder is deprecated.
    jbuilder build @install
}

package() {
    cd "${pkgname/ocaml-/}-$pkgver"

    export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
    mkdir -p "$DESTDIR"

    dune install --prefix="$DESTDIR" --libdir="$DESTDIR"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
