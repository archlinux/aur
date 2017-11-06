# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=ocaml-gen
pkgver=0.4.0.1
pkgrel=2
pkgdesc='Iterators for OCaml'
license=('BSD')
arch=('i686' 'x86_64')
url='https://github.com/c-cube/gen/'
depends=('ocaml' 'ocamlbuild')
source=("https://github.com/c-cube/gen/archive/${pkgver}.tar.gz")
options=(!strip !makeflags)
sha256sums=('ab6389821f807ac22857002c85b57f737f41bc9d4f1b81cf6472b113040792cd')

build() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

	./configure --disable-docs --disable-tests --disable-bench
    make all
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
