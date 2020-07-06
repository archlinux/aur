# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Daniel Peukert <dan.peukert@gmail.com>
pkgname=ocaml-sedlex
pkgver=2.2
pkgrel=1
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/ocaml-community/sedlex'
depends=('ocaml>=4.02.3'
         'ocaml-gen'
         'ocaml-migrate-parsetree'
         'ocaml-ppx_tools_versioned>=5.2.3'
         'ocaml-uchar')
source=("https://github.com/alainfrisch/sedlex/archive/v${pkgver}.tar.gz"
        'fix-pervasives.patch')
options=(!strip !makeflags)
sha256sums=('de5459c98568cd1e2b96e8af61e428015d7f6650a1c0ec362d538d0874730841'
            '39dcebebc8946c4cd192bd2662167b59f6e492e7394973bbea7ef23560e26f9d')

prepare() {
    cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

    patch --forward -p1 < "$srcdir/fix-pervasives.patch"
}

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et sw=4 sts=4 et:
