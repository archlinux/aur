# Maintainer:  Score_Under <seejay.11@gmail.com>
# Contributor: Catalin Hritcu <catalin.hritcu@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>
# Contributor: Leander Schröder <rleanderschroeder@gmail.com>

pkgname=ocaml-batteries
pkgver=3.3.0
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/ocaml-batteries-team/batteries-included"
license=('LGPL')
depends=('ocaml>=4.03' 'ocaml-findlib>=1.5.3' 'ocaml-num>=1.1')
optdepends=('ocaml-bisect')
makedepends=('ocamlbuild')
install=ocaml-batteries.install
source=("https://github.com/ocaml-batteries-team/batteries-included/archive/v${pkgver}.tar.gz")
sha512sums=('9e5f12d26b229a0d880d79695bbff32de5bc9ddf4faa3a421ebc5b0a20a9f3823f681200d9e7c03a22766d271e1e7ec4fa5721b91a3ed051ae9cf145829596f2')
options=(!strip !makeflags)

build(){
  cd "$srcdir/${pkgname/ocaml-/}-included-$pkgver"

  OCAMLBUILD="ocamlbuild -no-links" make all doc
}

package(){
  cd "$srcdir/${pkgname/ocaml-/}-included-$pkgver"

  export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$DESTDIR"
  mkdir -p $OCAMLFIND_DESTDIR

  OCAMLBUILD="ocamlbuild -no-links" make install
  DOCROOT="$pkgdir/usr/share/doc/$pkgname/" make install-doc
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 toplevel/ocamlinit "$pkgdir/usr/share/doc/$pkgname/ocamlinit"
}
