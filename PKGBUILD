# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>

_pkgname=lwt
pkgname=ocaml-${_pkgname}
pkgver=4.0.1
pkgrel=1
pkgdesc="A library for cooperative threads in OCaml"
arch=('i686' 'x86_64')
url="http://ocsigen.org/lwt/"
license=('custom:LGPL with OpenSSL linking exception')
depends=('libev' 'ocaml-migrate-parsetree' 'ocaml-ppx_tools_versioned' 'ocaml-react' 'ocaml-result')
makedepends=('dune' 'cppo')
source=("https://github.com/ocsigen/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('97ff4892eea38b2cc3cb9bc764afa31948d7c345a2caf6c60848d5ce60b2de25')
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
  install -Dm644 "doc/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
