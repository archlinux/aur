# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_ocamlname=mula
pkgname=ocaml-$_ocamlname
pkgver=0.1.2
pkgrel=1
pkgdesc="ML's radishal Universal Levenshtein Automata library."
arch=('x86_64')
url="https://github.com/ifazk/mula"
license=('CC0-1.0')
depends=('ocaml')
makedepends=('dune')
checkdepends=('ocaml-ppx_inline_test')
options=('!strip')
source=("${pkgname}-${pkgver}.tbz::${url}/releases/download/${pkgver}/mula-${pkgver}.tbz")
b2sums=('7624003a75ff38b05d9e26c62d64ffa73f67a4048f20313d233a854bbd862c189d2e6d47cd6ac51c61687c5abadbee9ec7f9b3ef9917a417354e4aebbafa2682')

check() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    dune runtest --verbose
}

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    dune build --verbose -p $_ocamlname
}

package() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

   DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   -p $_ocamlname

    # Move doc
    mv "${pkgdir}/usr/share/doc/${_ocamlname}" "${pkgdir}/usr/share/doc/${pkgname}"
}
