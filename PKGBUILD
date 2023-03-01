# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.0'
pkgrel='1'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-gen' 'ocaml-ppxlib>=0.26.0' 'ocaml-uchar')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('564780b7af8b3ddd32c9164caa42fd24b2ff59e0bf9977bcee4c3ddea2be3f0c870bd95949b639c5f1942e0fa2604902f5cd3eb9041d59b6ee2367895df556df')

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
