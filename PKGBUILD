# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.1'
pkgrel='2'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-gen' 'ocaml-ppxlib>=0.26.0')
makedepends=('dune>=2.8.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('27c7954c03a9d78f252167708afe7d91648ad3d3aa529e00c73da75bac49c2cf552cc9d27d29f1d9a04b1e2b47b7c6de9e9850c53124ad9f311d0a8f54bb9cae')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
