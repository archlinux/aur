# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='lambda-term'
pkgname="ocaml-$_projectname"
pkgver='3.2.0'
pkgrel='2'
pkgdesc='Terminal manipulation library for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.08.0' 'ocaml-camomile>=1.0.1' 'ocaml-lwt>=4.0.0' 'ocaml-lwt_log' 'ocaml-mew_vi>=0.5.0' 'ocaml-react' 'ocaml-zed>=3.0.0')
makedepends=('dune>=1.1.0')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b161341268450466da4aa42cb9b78960797ef61384ba9a11c08874286155dc5e0db4d68d313a714003ebc73c63e19bec17e5d39c57a8c32db0f0f7844d1dce6e')

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
