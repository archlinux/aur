# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domain-local-await'
pkgname="ocaml-$_projectname"
pkgver='0.2.1'
pkgrel='1'
pkgdesc='A scheduler independent blocking mechanism'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-compiler-libs' 'ocaml-thread-table>=0.1.0')
makedepends=('dune>=3.3.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ecce96ede9bdc4fa83e6061cc3106aafa9f1c64168439b76135a07c9b5facd2e7282ca7822b310f34f5a127eb92575fd01f0daa139c6e9e8490d816680e2111f')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	mv "$pkgdir/usr/share/doc/$_projectname" "$pkgdir/usr/share/doc/$pkgname"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
