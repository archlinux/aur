# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='utop'
pkgname="ocaml-$_projectname"
pkgver='2.12.0'
pkgrel='1'
pkgdesc='Universal toplevel for OCaml'
# If you're running on i686, pentium4, armv7h or aarch64, you have to add it to the arch array of the cppo, ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
# If you're running on pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-cmdliner, ocaml-uchar and ocaml-uutf AUR dependencies
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.08.0' 'ocaml-findlib>=1.7.2' 'ocaml-lambda-term>=3.1.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-react>=1.0.0' 'ocaml-zed>=3.2.0')
makedepends=('cppo>=1.1.2' 'dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('3f396f42cda0ac39d01357d9e09eacd5adb5176ffb73855e7775e004c64aa467846780bb0948fca14869f45f5f79b42878b4c3cae9769e9bfc713e5bc3cee753')

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
