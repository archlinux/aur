# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='zed'
pkgname="ocaml-$_projectname"
pkgver='3.2.2'
pkgrel='1'
pkgdesc='Abstract engine for text edition in OCaml'
# If you're running on aarch64, you have to add it to the arch array of the ocaml-cmdliner AUR dependency
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-react' 'ocaml-result' 'ocaml-uchar' 'ocaml-uuseg' 'ocaml-uucp>=2.0.0' 'ocaml-uutf')
makedepends=('dune>=3.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cb377ff972c8ef0501a8034c53f10d26a60c7735742945d930b26a8535de2fa36ecc9538518a26f2bed8d5e61a642408c1f0886c75945b50ad6a524ed8e1193b')

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
