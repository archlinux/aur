# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ocaml-tsort'
pkgver='2.1.0'
pkgrel='2'
pkgdesc='Easy to use and user-friendly topological sort module for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/dmbaturin/$pkgname"
license=('MIT')
depends=('ocaml>=4.03.0')
makedepends=('dune>=1.9.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f919057504cabada48b484aa0d6bf6831faf7c026d06b327c3f5f9b4292099dbb3a6ce532e8cb47c591f84cec51e0469ba861e7f64145b273d05ad52512eea46')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
