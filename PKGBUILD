# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: éclairevoyant
_projectname='ocaml-version'
pkgname="ocaml-$_projectname"
pkgver='4.0.2'
pkgrel='1'
pkgdesc='Manipulate, parse and generate OCaml compiler version strings'
arch=('x86_64' 'aarch64')
url="https://github.com/ocurrent/$_projectname"
license=('ISC')
depends=('ocaml>=4.07.0')
makedepends=('dune>=3.6.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1c85b6ea75ce27aa94ab783aea93a423cb14007dcfc8a25c4bc7fd5769d1c7325e648b35632599111d06dafb7e26af4b43ea82099406d328b307ccde9a23dc31')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
