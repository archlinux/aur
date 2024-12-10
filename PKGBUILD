# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Eric Fung <loseurmarbles[at]gmail[dot]com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.5.1
pkgrel=1
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('x86_64')
url="http://mmottl.github.io/pcre-ocaml"
license=('LicenseRef-LGPL2.1-with-OCaml-LGPL-linking-exception')
depends=('glibc' 'ocaml-base' 'ocaml-findlib' 'pcre')
makedepends=('dune')
provides=('pcre-ocaml')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
b2sums=('d277ba04b5f75364dc85521153ccb4b77368703720a84cc2780545615cefe700682d4250301254ec61d6598d870f8ed2572eb3d24f738cbbd92e0d7f00925012')

build() {
    cd "${srcdir}/pcre-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"
    dune build @install
}

package() {
    cd "${srcdir}/pcre-${pkgver}"

    dune install \
	 --prefix="/usr" \
	 --destdir="${pkgdir}" \
	 --libdir="$(ocamlfind printconf destdir)"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/doc/pcre/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"

    mv "${pkgdir}/usr/doc/pcre" "${pkgdir}/usr/doc/${pkgname}"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}
