# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_inline_test'
pkgname="ocaml-$_projectname"
pkgver='0.15.1'
pkgrel='1'
epoch='1'
pkgdesc='Syntax extension for writing in-line tests in ocaml code'
# If you're running on i686, pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-time_now>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('27dd4a4b9f0e8f7b22a7de4016ab0b8733e1ad4fe9e9e19cd98d321c071dd8662830a4e83579a2595d53b0a47c2ba03c1165df95312d6effc46c8aa13c0324b6')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails with "Error: No rule found for test/inline_tests_runner" and "Error: No rule found for test/inline_tests_runner.exe"
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
