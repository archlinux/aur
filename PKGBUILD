# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: Taylor Venable <taylor@metasyntax.net>
pkgname="ocaml-cryptokit"
pkgver='1.20'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'ocaml-zarith')
makedepends=('ocaml' 'ocaml-findlib' 'dune')
_srcname="release${pkgver//./}"
source=("https://github.com/xavierleroy/cryptokit/archive/${_srcname}.tar.gz")
sha256sums=('3a4205703c6819a2c338ffebb2c025af3ef3d24ad716cc9138b5099c5b346873')
options=('staticlibs')

build() {
    cd cryptokit-"${_srcname}"
    ./configure

    dune build -p cryptokit
}

package() {
    cd cryptokit-"${_srcname}"
    DESTDIR="$pkgdir" dune install --prefix "/usr" --libdir "$(ocamlfind printconf destdir)" -p cryptokit
    install -dm755 "${pkgdir}/usr/share"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}
