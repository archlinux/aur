# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>

pkgname=ocaml-batteries
pkgver=2.3
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml>=4.02' 'ocaml-findlib>=1.5.3')
install=ocaml-batteries.install
source=("http://forge.ocamlcore.org/frs/download.php/1465/batteries-$pkgver.tar.gz")
sha512sums=('0f55e75cc8057ec4ba9683aee91509a3bf2ee93d1990a932cd3924cd602aeeea80a5da50b0651500fc153285b1d80b9378ec1fa656e7f94311e992e9ba308c88')
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
