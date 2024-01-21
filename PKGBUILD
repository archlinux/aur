# Maintainer: Thomas Letan <lthms@soap.coffee>

_projectname=kqueue
pkgname=ocaml-$_projectname
pkgver=0.3.0
pkgrel=2
license=('BSD-3-Clause')
arch=('x86_64')
pkgdesc="OCaml bindings to kqueue"
url="https://github.com/anuragsoni/$_projectname-ml"
depends=('ocaml' 'ocaml-ppx_optcomp')
makedepends=('dune')
source=(
  "$pkgname-$pkgver.tbz::https://github.com/anuragsoni/$_projectname-ml/releases/download/$pkgver/$_projectname-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "0e88e62c411b803e80955547a6c3a7035104a59d0dff9b105d278a13480fd8b0eab64901d6f648656b2849b078dcbd3dd6726782f18b7f1fea85d30caa28096a"
)

build() {
  cd "${srcdir}/$_projectname-${pkgver}"
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.
  dune build -p $_projectname
}

package() {
  cd "${srcdir}/$_projectname-${pkgver}"
  DESTDIR="${pkgdir}" dune install $_projectname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
