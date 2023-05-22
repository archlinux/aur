# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='zed'
pkgname="ocaml-$_projectname"
pkgver='3.2.1'
pkgrel='3'
pkgdesc='Abstract engine for text edition in OCaml'
# If you're running on i486, pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-cmdliner, ocaml-uchar and ocaml-uutf AUR dependencies
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-react' 'ocaml-result' 'ocaml-uchar' 'ocaml-uuseg' 'ocaml-uucp>=2.0.0' 'ocaml-uutf')
makedepends=('dune>=3.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a1de65684d04d5d44ca4396365c98bfa070cf7c78318b53c3ad3ecca2b411450158ef7644b235490d879b37fe983f1707fef527b69af0c2958e45fd1e7a30f11')

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
