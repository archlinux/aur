# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Mostly copied from ocaml-ppx_sexp_conv AUR package

_projectname='sexp_pretty'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='1'
epoch='1'
pkgdesc=''
pkgdesc='A library for pretty-printing s-expressions, using better indentation rules than the default pretty printer in Sexplib.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=(
	'ocaml>=4.08.0'
	'ocaml-base>=v0.15'
	'ocaml-ppx_base>=v0.15'
	'ocaml-sexplib>=v0.15'
	'ocaml-re>=1.8.0'
	)
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bc2a7aecfc3ae379a56e8940b9cc80ece686009c9f67233e7993e25ebbe251d62559601923db718a0f967cf42fc84024597c069659842760bb2ac5ce0eab8df2')

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
