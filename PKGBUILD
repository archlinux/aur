# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=tiny_httpd
pkgver=0.22
pkgrel=1
pkgdesc='Minimal HTTP server'
arch=('x86_64')
url='https://c-cube.github.io/tiny_httpd'
license=('MIT')
depends=(
'ocaml>=4.13.0'
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
sha256sums=('8d37574d90859f9f7a13fbdd9dd20b7bbd87701e41c31fd6ae75ef8c7522e66b')

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
