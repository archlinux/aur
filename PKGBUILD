# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>

pkgname=ocaml-batteries
pkgver=2.1
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib' 'ocaml-camomile>=0.7.0' 'ocaml-ounit')
install=ocaml-batteries.install
source=("http://forge.ocamlcore.org/frs/download.php/1218/batteries-$pkgver.tar.gz")
sha512sums=('03fa0d9ba3333e0b80d2aec087453c13497b419f22229432e7c99a519a03a013c647c9a09e32250f17dad3fe47975ff76901df9dd289c87a877e4665ac344f70')
options=(!strip !makeflags)

build(){
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

  OCAMLBUILD="ocamlbuild -no-links" make all doc
}

package(){
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"

  export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$DESTDIR"
  mkdir -p $OCAMLFIND_DESTDIR

  OCAMLBUILD="ocamlbuild -no-links" make install
  DOCROOT="$pkgdir/usr/share/doc/$pkgname/" make install-doc
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 ocamlinit $pkgdir/usr/share/doc/$pkgname/ocamlinit
}
