# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname='utop'
pkgname="ocaml-${_pkgname}"
pkgver=1.19.3
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml' 'cppo' 'ocaml-lambda-term' 'ocaml-lwt' 'ocaml-findlib' 'ocaml-react' 'camlp4')
source=("https://github.com/diml/utop/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('280f9a1062c53be8bae41cfd57ce29dd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix /usr --destdir "${pkgdir}" --enable-camlp4

  make
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
