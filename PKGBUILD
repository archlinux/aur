# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_tools
pkgname=ocaml-${_pkgname}
pkgver=5.0+4.03.0
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools"
arch=('i686' 'x86_64')
url="https://github.com/alainfrisch/ppx_tools"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/alainfrisch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5ca9f031ca0b2e986fc8e3514dfd70d9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver/+/-}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver/+/-}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
