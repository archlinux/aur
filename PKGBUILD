# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>

pkgname=ocaml-batteries
pkgver=2.2
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml>=4.01' 'ocaml-findlib' 'ocaml-camomile>=0.7.0' 'ocaml-ounit')
install=ocaml-batteries.install
source=("http://forge.ocamlcore.org/frs/download.php/1363/batteries-$pkgver.tar.gz")
sha512sums=('023d919cbb402e1386334865dfbd17a5a7a2eb07f8ddce682bab37b1d4b140bf5ce90519744d026ae012da20abbddf65707cff5e2568c9682b8fc69cf3f0977a')
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
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 ocamlinit "$pkgdir/usr/share/doc/$pkgname/ocamlinit"
}
