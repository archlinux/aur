# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=dune
pkgver=1.0+beta17
pkgrel=1
pkgdesc="A composable build system for OCaml (formerly jbuilder)"
arch=('x86_64' 'i686')
url="https://github.com/ocaml/dune"
license=('Apache')
depends=('ocaml' 'opam')
optdepends=('ocaml-findlib')
makedepends=('clingo')
provides=("jbuilder=${pkgver}")
conflicts=('jbuilder')
replaces=('jbuilder')
source=("https://github.com/ocaml/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c734e716e4fdb7e3564ed19b6eba2a1b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver/+/-}"

  make release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/+/-}"

  export OPAMROOT="${srcdir}/.opam"
  opam init -n

  install -dm755 "${pkgdir}$(ocamlc -where)" "${pkgdir}/usr/share"
  make install INSTALL_ARGS="'--prefix=${pkgdir}/usr' '--libdir=${pkgdir}$(ocamlc -where)'"

  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
}
