# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='utop'
pkgname="ocaml-$_projectname"
pkgver='2.10.0'
pkgrel='2'
pkgdesc='Universal toplevel for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.03.0' 'ocaml-findlib>=1.7.2' 'ocaml-lambda-term>=3.1.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-react>=1.0.0' 'ocaml-zed>=3.2.0')
makedepends=('cppo>=1.1.2' 'dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6f3c9b1ba670096b9f95f98ad50b8d06976390c5433650e1fa0c4dcc1fd8fdc77971a8a3b5d21cef4761b3b13b94653d1fe439780abcafe9f3ddd90f66bc6d7c')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	sed -i "s/%%VERSION%%/$pkgver/g" 'src/lib/uTop.ml'
}

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
