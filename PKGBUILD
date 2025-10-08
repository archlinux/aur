# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.7'
pkgrel='1'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-gen' 'ocaml-ppxlib>=0.26.0' 'zstd')
makedepends=('dune>=3.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('35b0a7873170822edb7a1046c4d7b7a87ded862f799d4c71f7c5fc86407e75e35749a355c94ecd4e1c5636dfacd3b1a42fb80e48bd87d19d8f4733f56019c358')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on this package by ocaml-ppx_expect

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
