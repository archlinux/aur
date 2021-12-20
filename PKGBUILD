# Contributor: Eric Fung <loseurmarbles[at]gmail[dot]com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.5.0
pkgrel=2
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('x86_64')
url="http://mmottl.github.io/pcre-ocaml"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-base' 'pcre')
makedepends=('dune')
provides=('pcre-ocaml')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
sha256sums=('671142f40b6d86171cbc067253faadf903019161d57488bd0fb6c5456c2cbd1a')

build() {
    cd "${srcdir}/pcre-${pkgver}"

    dune build @install
}

package() {
    cd "${srcdir}/pcre-${pkgver}"

    install -d "${pkgdir}/usr/share/doc"          \
        "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${pkgdir}/$(ocamlfind -printconf destdir)"

    dune install --prefix "${pkgdir}/usr/share" \
                 --libdir "${pkgdir}$(ocamlfind printconf destdir)"

    mv "${pkgdir}/usr/share/doc/pcre" "${pkgdir}/usr/share/doc/${pkgname}"

    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
