# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=ocaml-iostream
_pkgname=iostream
pkgver=0.3
pkgrel=2
pkgdesc='generic I/O streams of bytes'
arch=('x86_64')
url='https://c-cube.github.io/ocaml-iostream/'
license=('MIT')
depends=(
'ocaml>=4.08.0'
'ocaml-findlib'
)
makedepends=(
'dune'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/c-cube/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('142370fb3a43010f940edf96e460086e54611aeb67a0fdcff39a307897c33a8c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$_pkgname"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install "$_pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
