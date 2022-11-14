# Contributor: Eric Fung <loseurmarbles[at]gmail[dot]com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.5.0
pkgrel=3
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('x86_64')
url="http://mmottl.github.io/pcre-ocaml"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml-base' 'ocaml-findlib' 'pcre')
makedepends=('dune')
provides=('pcre-ocaml')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
sha256sums=('671142f40b6d86171cbc067253faadf903019161d57488bd0fb6c5456c2cbd1a')

build() {
    cd "${srcdir}/pcre-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"
    dune build @install
}

package() {
    cd "${srcdir}/pcre-${pkgver}"

    dune install --prefix="/usr" --destdir="${pkgdir}" --libdir="$(ocamlfind printconf destdir)"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/doc/pcre/LICENSE.md"
    mv "${pkgdir}/usr/doc/pcre" "${pkgdir}/usr/doc/${pkgname}"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}
