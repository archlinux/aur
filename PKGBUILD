# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.7.30
pkgrel=3
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.04.0'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.4.2'
'ocaml-sqlite3>=1.6.1'
'ocaml-extlib'
'tiny_httpd>=0.6'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3fe3f0d4051f1a81e37f6da9e8a492eb3c81f7450c6b43fee81a7fd94249bfa0')

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
