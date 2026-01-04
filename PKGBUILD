# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: Taylor Venable <taylor@metasyntax.net>
pkgname="ocaml-cryptokit"
pkgver='1.21.1'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'ocaml-zarith')
makedepends=('ocaml' 'ocaml-findlib' 'dune')
_srcname="release${pkgver//./}"
source=("https://github.com/xavierleroy/cryptokit/archive/${_srcname}.tar.gz")
sha256sums=('186fda8b2063882688e1c2621c8234c35acdf4e10cfdd3213ee04bef16902953')
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
