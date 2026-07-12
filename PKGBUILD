# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.9.0
pkgrel=1
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.08.0'
'ocamlfuse>=3.10.0'
'gapi-ocaml>=0.4.9'
'ocaml-sqlite3>=1.6.1'
'ocaml-extlib'
'tiny_httpd>=0.10'
'ocaml-otoml'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3e548ecd607e4c6efc673ce44c5da599df32d401b446f4223a3a0503466778bd')

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
