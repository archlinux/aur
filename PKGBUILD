# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppx_derivers-git
pkgver=20190404
pkgrel=2
pkgdesc="deriving plugin registry"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppx_derivers'
license=('BSD')
provides=('ocaml-ppx_derivers')
conflicts=('ocaml-ppx_derivers')
makedepends=('ocamlbuild' 'ocaml-findlib' 'dune')
source=("${pkgname}::git://github.com/ocaml-ppx/ppx_derivers.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  dune build
}

package() {
  cd "$pkgname"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
