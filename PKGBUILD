# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-camomile
pkgver=1.0.2
pkgrel=3
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
depends=('ocaml')
makedepends=('dune' 'ocaml-findlib')
source=(https://github.com/yoriyuki/Camomile/archive/$pkgver.tar.gz)

build() {
  cd "Camomile-${pkgver}"
  find . -name "*.mli" -exec sed -i 's,Pervasives.in_channel,Stdlib.in_channel,g' {} +
  find . -name "*.mli" -exec sed -i 's,Pervasives.out_channel,Stdlib.out_channel,g' {} +
  find . -name "*.ml" -exec sed -i 's,Pervasives.in_channel,Stdlib.in_channel,g' {} +
  find . -name "*.ml" -exec sed -i 's,Pervasives.out_channel,Stdlib.out_channel,g' {} +
  find . -name "*.ml" -exec sed -i 's,Pervasives.compare,Stdlib.compare,g' {} +
  dune build
}

package() {
  cd "Camomile-${pkgver}"

  dune install \
    --destdir="${pkgdir}" \
    --prefix="/usr" \
    --libdir="$(ocamlfind printconf destdir)"
  
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('2149ed1731141b29e0265e99493060eb552ac98938b031c4f496190ba97e85f6')
