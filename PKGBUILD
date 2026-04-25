# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tambet Arak <tambetarak+nospam@gmail.com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
pkgver=5.4.1
pkgrel=1
arch=('x86_64')
license=('MIT')
pkgdesc='SQLite3 bindings for OCaml'
url='https://mmottl.github.io/sqlite3-ocaml/'
depends=('ocaml' 'ocaml-stdio' 'sqlite>=3')
makedepends=('dune' 'ocaml-csexp' 'ocaml-findlib')
provides=('sqlite3-ocaml')
replaces=('sqlite3-ocaml')
conflicts=('sqlite3-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/sqlite3-ocaml/releases/download/${pkgver}/sqlite3-${pkgver}.tbz")
sha256sums=('729ec193fb1992bb1a2bce6736adbc82aa5bdb45d41c8cb715f84d5663a26135')

build() {
    cd "${srcdir}/sqlite3-${pkgver}"
    dune build @install
}

package() {
    cd "${srcdir}/sqlite3-${pkgver}"

    install -d "${pkgdir}/usr/share/doc"          \
        "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${pkgdir}/$(ocamlfind -printconf destdir)"

    dune install --destdir "$pkgdir" \
                 --prefix "/usr/share" \
                 --libdir "$(ocamlfind printconf destdir)"

    mv "${pkgdir}/usr/share/doc/sqlite3" "${pkgdir}/usr/share/doc/${pkgname}"

    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
