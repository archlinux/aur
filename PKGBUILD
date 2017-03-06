# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-oasis
pkgver=0.4.8
pkgrel=1
pkgdesc='Architecture for building OCaml libraries and applications.'
arch=('i686' 'x86_64')
url="http://oasis.forge.ocamlcore.org"
license=('LGPL')
depends=('glibc' 'pcre')
makedepends=('ocaml'
             'ocamlbuild'
             'ocaml-fileutils>=0.4.2'
             'ocaml-findlib'
             'ocaml-ocamlify'
             'ocaml-ocamlmod')
source=("http://forge.ocamlcore.org/frs/download.php/1669/oasis-${pkgver}.tar.gz")
sha512sums=('e0baf0f048647c25eac5472db0d2a22d0fcaf85fe61ebd88ec5a101c20d4916ecfa9d10fae069ba4479abb22b90c44f18312b9252727a8c7c7de4aa2d8d72663')
options=(!strip)

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  ocaml setup.ml -configure --prefix "$pkgdir" --exec-prefix "$pkgdir/usr"
  ocaml setup.ml -build
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"
  ocaml setup.ml -install
}
