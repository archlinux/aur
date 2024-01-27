# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ocaml-tsort'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Easy to use and user-friendly topological sort module for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/dmbaturin/$pkgname"
license=('MIT')
depends=('ocaml>=4.03.0')
makedepends=('dune>=1.9.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cf0a6295eed3ca29dbedb1b32c736b37e98587d5420d2f6443b70ca3c50c8d75c508a245d243a3f28bfe9c250abc3a37d4f461b187d2459670eae4cb088514aa')

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
