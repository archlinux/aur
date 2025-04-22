# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=tiny_httpd
pkgver=0.19
pkgrel=3
pkgdesc='Minimal HTTP server'
arch=('x86_64')
url='https://c-cube.github.io/tiny_httpd'
license=('MIT')
depends=(
'ocaml>=4.08.0'
'ocaml-iostream'
'ocaml-hmap'
'ocaml-seq'
)
makedepends=(
'dune'
'ocaml-findlib'
'ocaml-result'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/c-cube/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d567e17a181ab667d760906a9a33b9c59c95506e95c4e60710b31355bcacbbf2')

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
