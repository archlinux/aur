# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>

pkgname=ocaml-batteries
pkgver=2.0
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib' 'ocaml-camomile>=0.7.0' 'ocaml-ounit')
install=ocaml-batteries.install
source=("http://forge.ocamlcore.org/frs/download.php/1096/batteries-$pkgver.tar.gz")
sha512sums=('fc491f288f57f85e1ee0446ed0f8a7bd9cb8ba77715b91576b576c1144b596c627116f8975c06edd7cd47831f86eeb6b986ac5d0aa247518893cefaa363230bb')
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
