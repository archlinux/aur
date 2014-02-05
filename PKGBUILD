# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-oasis
pkgver=0.3.0
pkgrel=2
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
             'ocaml-odn>=0.0.3'
             'ocaml-ounit'
             'ocaml-ocamlmod'
             'ocaml-pcre'
             'ocaml-expect>=0.0.3')
source=("http://forge.ocamlcore.org/frs/download.php/918/oasis-$pkgver.tar.gz")
md5sums=('c2b6dec8c12517d85ce98e7feffe2531')
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
