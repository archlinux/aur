# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ocaml-earley
pkgver=3.0.0
pkgrel=1
pkgdesc='Parsing library based on Earley Algorithm'
arch=(i686 x86_64)
url="https://github.com/rlepigre/$pkgname"
license=(custom:CECILLB)
depends=(ocaml
         zstd libzstd.so)
makedepends=(dune
             ocaml-stdlib-shims)
options=(!strip)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('1fb2e0098bfa82407c7bf287edcc78a7c0410acc16f3a975551850b7457f0c77')

build() {
	cd "$_archive"
	dune build -p ${pkgname#*-}
}

package() {
	cd "$_archive"
	dune install \
		--prefix "/usr" \
		--libdir "/usr/lib/ocaml" \
		--docdir "/usr/share/doc" \
		--destdir "$pkgdir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
