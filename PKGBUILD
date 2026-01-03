# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_ocamlname=domain-name
pkgname=ocaml-$_ocamlname
pkgver=0.5.0
pkgrel=1
pkgdesc="RFC 1035 Internet domain names"
arch=('x86_64')
url="https://github.com/hannesm/domain-name"
license=('ISC')
depends=('ocaml')
makedepends=('dune')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("${pkgname}-${pkgver}.tbz::${url}/releases/download/v${pkgver}/${_ocamlname}-${pkgver}.tbz")
sha256sums=('9ec7ae2c22772c150b84cfa3f21d9bf25fae14a796f31e20df52d86f46499d89')

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
	   --docdir "/usr/share/doc"

    # Move doc
    mv "${pkgdir}/usr/share/doc/${_ocamlname}" "${pkgdir}/usr/share/doc/${pkgname}"

    # Move license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
