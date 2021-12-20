# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tambet Arak <tambetarak+nospam@gmail.com>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
pkgver=5.1.0
pkgrel=1
arch=('x86_64')
license=('MIT')
pkgdesc='SQLite3 bindings for OCaml'
url='https://mmottl.github.io/sqlite3-ocaml/'
depends=('ocaml' 'ocaml-stdio' 'sqlite>=3')
makedepends=('dune')
provides=('sqlite3-ocaml')
replaces=('sqlite3-ocaml')
conflicts=('sqlite3-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/sqlite3-ocaml/releases/download/${pkgver}/sqlite3-${pkgver}.tbz")
sha256sums=('bb0db711691a8dfa24fe29ec4ecb6912444ad90e0f4c447af89831e6d1dffea5')

build() {
    cd "${srcdir}/sqlite3-${pkgver}"
    dune build @install
}

package() {
    cd "${srcdir}/sqlite3-${pkgver}"

    install -d "${pkgdir}/usr/share/doc"          \
        "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${pkgdir}/$(ocamlfind -printconf destdir)"

    dune install --prefix "${pkgdir}/usr/share" \
                 --libdir "${pkgdir}$(ocamlfind printconf destdir)"

    mv "${pkgdir}/usr/share/doc/sqlite3" "${pkgdir}/usr/share/doc/${pkgname}"

    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
