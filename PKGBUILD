# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>

pkgname=ocaml-batteries
pkgver=2.5.0
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml>=4.03' 'ocaml-findlib>=1.5.3')
optdepends=('ocaml-bisect')
makedepends=('ocamlbuild')
install=ocaml-batteries.install
source=("https://github.com/ocaml-batteries-team/batteries-included/archive/v${pkgver}.tar.gz")
sha512sums=('3a6d5262691ffd0b38c5b7052a8c674d921015073e084af4ba8db4cffedaacc9b8dd4c62665ae7828c127cc5c1e2f8f5e4d480d2cd25fa0ee8d5f0751dd50eb0')
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
  install -Dm 644 ocamlinit "$pkgdir/usr/share/doc/$pkgname/ocamlinit"
}
