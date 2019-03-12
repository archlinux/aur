# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_tools
pkgname=ocaml-${_pkgname}
pkgver=5.1+4.06.0
pkgrel=2
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools"
arch=('i686' 'x86_64')
url="https://github.com/ocaml-ppx/ppx_tools"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/ocaml-ppx/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6ba2e9690b1f579ba562b86022d1c308')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver/+/-}"

  make -j1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver/+/-}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
