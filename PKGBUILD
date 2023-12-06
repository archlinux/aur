# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='oseq'
pkgname="ocaml-$_projectname"
pkgver='0.5.1'
_commit='b44a72b18210d69a894672c955828db1a4feab9c'
pkgrel='1'
pkgdesc='Purely functional iterators compatible with standard seq for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('BSD')
depends=('ocaml>=4.08.0')
makedepends=('dune>=1.0.0')
checkdepends=('ocaml-containers' 'ocaml-gen' 'ocaml-qcheck')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('SKIP')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done
}
