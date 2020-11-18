# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tambet Arak <tambetarak+nospam@gmail.com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
_pkgname=sqlite3-ocaml
pkgver=5.0.2
pkgrel=1
arch=('x86_64')
license=('MIT')
pkgdesc='SQLite3 bindings for OCaml'
url='https://github.com/mmottl/sqlite3-ocaml'
depends=('ocaml' 'ocaml-base' 'ocaml-stdio' 'sqlite3')
makedepends=('ocaml-findlib' 'dune')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mmottl/sqlite3-ocaml/archive/${pkgver}.tar.gz")
sha256sums=('345811e9f6dc0478e0b5cc82bd75fc2859fab2a96e8fde424c95df23f4267f9c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  dune build @install
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)"
  dune install --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}/$(ocamlfind printconf destdir)"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}
