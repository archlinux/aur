# Maintainer:  Score_Under <seejay.11@gmail.com>

pkgname=(ocaml-odoc ocaml-odoc-parser)
pkgver=3.2.1
pkgrel=1
pkgdesc="Documentation compiler for OCaml"
arch=(x86_64)
url="https://ocaml.github.io/odoc/"
license=(custom)
depends=(ocaml ocaml-tyxml ocaml-fpath ocaml-fmt)
makedepends=(dune cppo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocaml/odoc/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d4e70455abbc3644f8b71839ac0abb3a4a70260b474b9dce6f11fa043e03896ee75ec7b101ac1b6d45bd78c4d8b1ddacd855f77f67e78524815f18725db1a712')

build(){
  cd "$srcdir/odoc-$pkgver"
  dune build -p odoc-parser,odoc
}

package_ocaml-odoc(){
  cd "$srcdir/odoc-$pkgver"
  DESTDIR="$pkgdir" dune install -p odoc --prefix=/usr --libdir=/usr/lib/ocaml
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ocaml-odoc-parser(){
  cd "$srcdir/odoc-$pkgver"
  DESTDIR="$pkgdir" dune install -p odoc-parser --prefix=/usr --libdir=/usr/lib/ocaml
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
