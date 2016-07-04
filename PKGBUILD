# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Paolo Herms
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Jose Neder <jlneder(at)gmail(dot)com>

pkgname=ocaml-ocamlgraph
pkgver=1.8.6
pkgrel=1
pkgdesc="Graph library for OCaml"
url="http://ocamlgraph.lri.fr"
source=("http://ocamlgraph.lri.fr/download/ocamlgraph-$pkgver.tar.gz")
md5sums=('afbc24f0e0eb72c2d3eda64b68513e73')
options=('!strip' '!makeflags')
depends=('ocaml')
makedepends=('ocaml-findlib' 'lablgtk2')
arch=('i686' 'x86_64')
license=('LGPL')

build() {
  cd "$srcdir/ocamlgraph-$pkgver"
  ./configure --prefix=/usr
  make all viewer doc
}

package() {
  cd "$srcdir/ocamlgraph-$pkgver"
  OCAMLFIND_DESTDIR=$pkgdir$(ocamlfind printconf destdir)
  mkdir -p $OCAMLFIND_DESTDIR
  make DESTDIR=$pkgdir OCAMLFINDDEST="-destdir $OCAMLFIND_DESTDIR" install-findlib
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname/" doc/*
  install -Dm 755 dgraph/dgraph.opt "${pkgdir}/usr/bin/graph-viewer"
  install -Dm 755 editor/editor.opt "${pkgdir}/usr/bin/graph-editor"
}
