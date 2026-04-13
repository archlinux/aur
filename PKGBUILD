# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: nerflad (nerflad@gmail.com)
pkgname=gapi-ocaml
pkgver=0.4.9
pkgrel=1
pkgdesc='A simple OCaml client for Google Services.'
arch=('x86_64')
url='https://astrada.github.io/gapi-ocaml/'
license=('MIT')
depends=(
'ocaml>=4.08.0'
'ocaml-findlib>=1.2.7'
'ocaml-curl>=0.5.3'
'ocaml-cryptokit>=1.21'
'ocaml-yojson>=1.6.0'
'cppo>=1.1.0'
'camlp-streams'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e189067f3caf58235eee7f3f1b0f051d0192cd012e444c87492b2b502ad7c29c')

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
