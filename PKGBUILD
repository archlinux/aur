# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='trie'
pkgname="ocaml-$_projectname"
pkgver='1.0.0'
pkgrel='5'
pkgdesc='Strict impure trie tree'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1921a42486a0a221e546507287cbf28ccae5462abe55817269517b7b92e19f35031f2d0fba2b1890b97236d6fff11be9d76ade317ae1dfa1089bd4740a46786f')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
