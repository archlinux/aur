# Maintainer:  Score_Under <seejay.11@gmail.com>

pkgname=ocaml-benchmark
pkgver=1.7
pkgrel=2
pkgdesc="A benchmarking library for OCaml"
arch=(x86_64)
url="https://github.com/Chris00/ocaml-benchmark"
license=(LGPL-3.0-only)
depends=(ocaml)
makedepends=(dune)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chris00/ocaml-benchmark/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a084fb433c83914f12db440c84a24cadae08ebbe6d4142e3812ac3ca34a0b4d59cca076f42c36e08782cd602ca6042c5a78500e437980ca988efa55b4d47a3c1')
options=(!strip !debug)

build(){
  cd "$srcdir/$pkgname-$pkgver"
  dune build -p benchmark @install
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" dune install -p benchmark --prefix=/usr --libdir=/usr/lib/ocaml --docdir=/usr/share/doc
  mv -- "$pkgdir/usr/share/doc/benchmark" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  rm -f "$pkgdir/usr/doc/benchmark/LICENSE.md"
}
