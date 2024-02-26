# Maintainer: oliver < a t >  first . in-berlin . de
# former maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname="ocaml-cryptokit"
pkgver='1.19'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('i686' 'x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'ocaml-zarith')
makedepends=('ocaml' 'ocaml-findlib' 'dune')
_srcname="release${pkgver//./}"
source=("https://github.com/xavierleroy/cryptokit/archive/${_srcname}.tar.gz")
sha256sums=('a7e203aac7fb86fa26fbcc5e7243c8e0f46f0d084bfaf06767d0b816fc12ccb1')
options=('staticlibs')

build() {
    #tar -xzvf release1161.tar.gz
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
