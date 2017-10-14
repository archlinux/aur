# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=jbuilder
pkgver=1.0+beta14
pkgrel=1
pkgdesc="A composable build system for OCaml"
arch=('x86_64' 'i686')
url="https://github.com/janestreet/jbuilder"
license=('Apache')
depends=('ocaml' 'opam')
optdepends=('ocaml-findlib')
makedepends=('clingo')
source=("https://github.com/janestreet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('579511fb64a35a98e60d6b20f4206a81')

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
