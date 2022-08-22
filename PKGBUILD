# Maintainer: Dct Mei <dctxmei@yandex.com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=2.4.0
pkgrel=2
pkgdesc="Convert OCaml parsetrees between different major versions"
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-compiler-libs')
makedepends=('dune')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d2b109129b7fd94c3514392d5986896d0b0b9a7c5f17ef56bc907d4a4f784ed4')
b2sums=('cb8cae9eb30c09803944aae428cb0b5f8a52fdcb168beca956071507f9b3739664ee7fd99f823ca900ed61283422344ecebd96d1f526b76e6d334e3149e7e995')

build() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"/
    dune build --release --verbose
}

# fails because of a circular dependency on this package by lwt
#check() {
#    cd "${srcdir}"/"${pkgname}-${pkgver}"/
#    dune runtest --release --verbose
#}

package() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"/
    DESTDIR="${pkgdir}" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose
    install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/doc/"${pkgname}"/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
