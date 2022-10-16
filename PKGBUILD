# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=tiny_httpd
pkgver=0.12
pkgrel=1
pkgdesc='Minimal HTTP server'
arch=('x86_64')
url='https://c-cube.github.io/tiny_httpd'
license=('MIT')
depends=(
'ocaml>=4.04.0'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/c-cube/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6e68a4e333d3ae5b4e877de0680489a995ddf94f60695f22280c451cf939e424')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$pkgname"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install "$pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
