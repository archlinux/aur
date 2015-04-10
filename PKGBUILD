# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-oasis
pkgver=0.4.5
pkgrel=1
pkgdesc='Architecture for building OCaml libraries and applications.'
arch=('i686' 'x86_64')
url=("http://oasis.forge.ocamlcore.org")
license=('LGPL')
depends=('glibc' 'pcre')
makedepends=('ocaml'
             'ocaml-batteries'
             'ocaml-fileutils>=0.4.2'
             'ocaml-findlib'
             'ocaml-ocamlgraph'
             'ocaml-ocamlify'
             'ocaml-odn>=0.0.11'
             'ocaml-ounit'
             'ocaml-ocamlmod'
             'ocaml-pcre'
             'ocaml-expect>=0.0.3')
source=("http://forge.ocamlcore.org/frs/download.php/1475/oasis-${pkgver}.tar.gz")
sha512sums=('97d5401762ffda6bf4d7a239d9c77f8647d58da1728925e6de6e8fdfded6f8e7bb69652a838b86ab7203cd68436b06f76921c76840b97db56a94bb87d74450d7')
options=(!strip)

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  make CONFIGUREFLAGS="--prefix /usr --destdir $pkgdir --disable-tests" build
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"
  make install
}
