# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-oasis
pkgver=0.4.4
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
source=("http://forge.ocamlcore.org/frs/download.php/1391/oasis-${pkgver}.tar.gz")
sha512sums=('1abb6e01f93029c5d9af3422a0e93b215182577225ad949442a4b69d0904620c20547941bad96fb27ad0034a0a4b472b586aac2614e89f5faae3084b751ed3c8')
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
