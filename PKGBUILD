# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-oasis
pkgver=0.4.1
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
source=("http://forge.ocamlcore.org/frs/download.php/1355/oasis-${pkgver}.tar.gz")
sha512sums=('34424f174794cc00de485660134e6358fda222a2d5bb29959be31dd8bdeacac9c37d2c3bdffd9c4ee3d53b05695e1e7580858198fcd088104e60f2c813401e23')
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
