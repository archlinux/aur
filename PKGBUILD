# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Mostly copied from ocaml-ppx_sexp_conv AUR package

_projectname='expect_test_helpers_core'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='1'
epoch='1'
pkgdesc='Helpers for writing expectation tests'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=(
	'ocaml>=4.08.0'
	'ocaml-base>=v0.15'
	'ocaml-base_quickcheck>=v0.15'
	'ocaml-core>=v0.15'
	'ocaml-ppx_jane>=v0.15'
	'ocaml-sexp_pretty>=v0.15'
	'ocaml-stdio>=v0.15'
	'ocaml-re>=1.8.0'
	)
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c08bda03c3bbc5c7ee1e970b5ba03e319826b7dd550d073f69b373bfa429c489ae1fcd388a2629f3d81729a96aac5614b4b1bcadd4040a290ffaab55b26bb9d6')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
