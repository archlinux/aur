# Maintainer: oliver < a t >  first . in-berlin . de
# former maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname="ocaml-cryptokit"
pkgver='1.161'
pkgrel=2
pkgdesc='Cryptographic primitives for OCaml'
arch=('i686' 'x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'ocaml-zarith') # OCaml as depend, or only makedepends?
makedepends=('ocaml' 'ocaml-findlib' 'dune')
_srcname="release${pkgver//./}"
source=("https://github.com/xavierleroy/cryptokit/archive/${_srcname}.tar.gz")
md5sums=('18591fc3f467bc33681be2cede36b8f1')

sha256sums=('2c183579f7edbc18f5b3ec8d60e2dfe566d032988a475c22b6c9d450c89cf84f')
options=('staticlibs')

build() {

    #tar -xzvf release1161.tar.gz
    cd cryptokit-"${_srcname}"
    ./configure

    dune build -p cryptokit
}

package() {
    cd cryptokit-"${_srcname}"
    DESTDIR="$pkgdir" dune install --prefix "/usr" --libdir "lib/ocaml" -p cryptokit
    install -dm755 "${pkgdir}/usr/share"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}
