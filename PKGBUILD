pkgname=ocaml-psmt2-frontend
_pkgname=psmt2-frontend
pkgver=0.2
pkgrel=2
pkgdesc="A simple parser and type-checker for polomorphic extension of the SMT-LIB 2 language"
arch=('x86_64')
url="https://github.com/Coquera/psmt2-frontend"
license=('Apache2')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-menhir')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OCamlPro-Coquera/psmt2-frontend/archive/$pkgver.tar.gz")
sha256sums=('59c25982fcdae1128dea6f260e76bbfd1dd4fe45b34aa168ae084281f4941303')

build() {
  cd "$_pkgname-$pkgver"
  autoreconf -fi

  ./configure
  make
  make META
}

package() {
  cd "$_pkgname-$pkgver"

  install -dm0755 "$pkgdir"/usr/lib/ocaml
  OCAMLFIND_DESTDIR="$pkgdir"/usr/lib/ocaml ocamlfind install psmt2-frontend src/psmt2Frontend.* src/*.mli META
}
