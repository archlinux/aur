# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>

_pkgname=lwt
pkgname=ocaml-${_pkgname}
pkgver=4.1.0
pkgrel=1
pkgdesc="A library for cooperative threads in OCaml"
arch=('i686' 'x86_64')
url="http://ocsigen.org/lwt/"
license=('MIT')
depends=('libev' 'ocaml-migrate-parsetree' 'ocaml-ppx_tools_versioned' 'ocaml-react' 'ocaml-result')
makedepends=('ocaml-findlib' 'dune' 'cppo')
source=("https://github.com/ocsigen/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('974e941f0e9c63200935ebd5e6bd4be5acde3ad1fd067fb7ebe54db952001056')
options=('!strip' '!makeflags' 'staticlibs')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ocaml src/util/configure.ml -use-libev true
  jbuilder build
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
