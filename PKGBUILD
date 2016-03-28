# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname='utop'
pkgname="ocaml-${_pkgname}"
pkgver=1.18.2
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml' 'cppo' 'ocaml-lambda-term' 'ocaml-lwt' 'ocaml-findlib' 'ocaml-react' 'camlp4')
source=("https://github.com/diml/utop/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('f2e548251fa888df8fbbd4921d3bf465')

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
