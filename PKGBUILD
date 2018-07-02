# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-gen
pkgver=0.5.1
pkgrel=1
pkgdesc='Iterators for OCaml'
license=('BSD')
arch=('i686' 'x86_64')
url='https://github.com/c-cube/gen/'
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
source=("https://github.com/c-cube/gen/archive/${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('2bc625f816a4c2efe3a781552551862e7eacca26a1000ea3698fa4c08eec2c6a')

build() {
    cd "${pkgname/ocaml-/}-$pkgver"

    make
}

package() {
    cd "${pkgname/ocaml-/}-$pkgver"

    export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
    mkdir -p "$DESTDIR"

    jbuilder install --prefix="$DESTDIR" --libdir="$DESTDIR"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
