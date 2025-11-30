# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=merlin-git
_pkgname=merlin
pkgver=20251119
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs (ocamlmerlin binary only)"
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib' 'ocaml-yojson' 'ocaml-csexp')
makedepends=('git' 'dune')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=(git+https://github.com/ocaml/merlin)
sha256sums=('SKIP')
options=('!strip')
provides=('merlin')
conflicts=('merlin')

pkgver() {
  cd ${_pkgname}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${_pkgname}

  dune build --release
}

package() {
  cd ${_pkgname}

  dune install --destdir "${pkgdir}" --prefix="/usr" --libdir="/usr/lib/ocaml" --docdir "/usr/share/doc"

  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
