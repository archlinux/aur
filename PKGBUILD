# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname='utop'
pkgname="ocaml-${_pkgname}"
pkgver=1.18.1
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml>=4.01.0' 'ocaml-findlib>=1.4.0' 'cppo>=1.0.1' 'ocaml-react' 'ocaml-lwt>=2.4.0' 'ocaml-camomile>=0.8' 'ocaml-zed>=1.2' 'ocaml-lambda-term>=1.2' 'camlp4')
source=("https://github.com/diml/utop/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('d943512656806c06ecf327c37c9aa831')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix /usr --destdir "${pkgdir}" --enable-camlp4

  make
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" \
    make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
