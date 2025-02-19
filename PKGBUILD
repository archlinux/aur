# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='crowbar'
pkgname="ocaml-$_projectname"
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Property fuzzing for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/stedolan/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-afl-persistent>=1.1' 'ocaml-cmdliner>=1.1.0' 'ocaml-ocplib-endian')
makedepends=('dune>=2.9.0')
checkdepends=('ocaml-calendar>=2.0.0' 'ocaml-fpath' 'ocaml-pprint' 'ocaml-uucp' 'ocaml-uunf' 'ocaml-uutf')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('374980856366dcee94b61705057e475709e7c939655831ea62d0bfaec885875ec329c1c9a2b629123fe452efb2b3bb1324e0e05e3926d641beef44029713dc1c')

_sourcedirectory="$_projectname-$pkgver"

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
