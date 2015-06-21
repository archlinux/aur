# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ocaml-ocamlgraph-git
pkgver=20150621
pkgrel=1
pkgdesc="Graph library for OCaml"
url="https://github.com/backtracking/ocamlgraph"
source=("git+https://github.com/backtracking/ocamlgraph.git")
md5sums=('SKIP')
options=('!strip' '!makeflags' 'staticlibs')
provides=('ocaml-ocamlgraph')
depends=('ocaml')
makedepends=('git' 'autoconf' 'ocaml-findlib' 'lablgtk2')
arch=('any')
license=('LGPL')

build() {
  cd "$srcdir/ocamlgraph"
  autoconf
  ./configure --prefix=/usr
  make all viewer # for now, make doc fails.
}

package() {
  cd "$srcdir/ocamlgraph"
  OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"
  make DESTDIR="$OCAMLFIND_DESTDIR" install-findlib
  #install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  #install -t "${pkgdir}/usr/share/doc/$pkgname/" doc/*
  install -Dm 755 dgraph/dgraph.opt "${pkgdir}/usr/bin/graph-viewer"
  install -Dm 755 editor/editor.opt "${pkgdir}/usr/bin/graph-editor"
}
