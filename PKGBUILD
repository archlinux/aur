# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='wtf8'
pkgname="ocaml-$_projectname"
pkgver='1.0.2'
pkgrel='1'
pkgdesc='An ocaml library that implements a WTF-8 encoder and decoder'
arch=('x86_64' 'i686')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('269afc56f4a9591cbcbf965aaa2d028df82071cac9117ecc4bf19ef11e1cfc65')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
