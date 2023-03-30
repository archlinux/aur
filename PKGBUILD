# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: nerflad (nerflad@gmail.com)
pkgname=gapi-ocaml
pkgver=0.4.3
pkgrel=1
pkgdesc='A simple OCaml client for Google Services.'
arch=('x86_64')
url='https://astrada.github.io/gapi-ocaml/'
license=('MIT')
depends=(
'ocaml>=4.02.3'
'ocaml-findlib>=1.2.7'
'ocamlnet>=4.1.4'
'ocaml-curl>=0.5.3'
'ocaml-cryptokit>=1.3.14'
'ocaml-yojson>=1.6.0'
'ocaml-yojson<2.0.0'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d8d551fae40494e0042bf25335e04fee57df38f490a0e4e8f6ec189fbfdada0d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$pkgname"

    sed -i '/doc:\s\[/,$d' _build/default/gapi-ocaml.install
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install "$pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    #mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
