# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_ocamlname=ipaddr
pkgname=ocaml-$_ocamlname
pkgver=5.6.1
pkgrel=1
pkgdesc="A library for manipulation of IP (and MAC) address representations"
arch=('x86_64')
url="https://github.com/mirage/ocaml-ipaddr"
license=('ISC')
depends=('ocaml')
makedepends=('dune')
checkdepends=('ocaml-ounit' 'ocaml-ppx_sexp_conv')
options=('!strip')
source=("${pkgname}-${pkgver}.tbz::${url}/releases/download/v${pkgver}/${_ocamlname}-${pkgver}.tbz")
sha256sums=('1e617df8abd45843c823e9be75267d27426cb578661cf25622d50b25ae14a319')

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

    # Move license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
