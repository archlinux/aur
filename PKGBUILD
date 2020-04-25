# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='lambda-term'
pkgname="ocaml-$_projectname"
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Terminal manipulation library for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.1' 'ocaml-lwt>=4.0.0' 'ocaml-lwt_log' 'ocaml-mew_vi>=0.3.0' 'ocaml-react' 'ocaml-zed>=3.0.0')
makedepends=('dune>=1.1.0')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('65e16c9a52fa03a6b3a3772566414b0d35cadceac3f244301ef56dad4c6ccc18')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' -p "$_projectname" --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	mv "$pkgdir/usr/man/" "$pkgdir/usr/share/man/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
