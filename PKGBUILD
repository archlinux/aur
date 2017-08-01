# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=jbuilder
pkgver=1.0+beta11
pkgrel=1
pkgdesc="A composable build system for OCaml"
arch=('x86_64' 'i686')
url="https://github.com/janestreet/jbuilder"
license=('Apache')
depends=('ocaml' 'opam')
optdepends=('ocaml-findlib')
source=("https://github.com/janestreet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6a3fac05e9e1bd7e65c94decc1b94c8a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver/+/-}"

  make release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/+/-}"

  export OPAMROOT="${srcdir}/.opam"
  opam init -n

  install -dm755 "${pkgdir}$(ocamlc -where)" "${pkgdir}/usr/share"
  make install PREFIX="${pkgdir}/usr"

  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/jbuilder" "${pkgdir}$(ocamlc -where)/"
}
