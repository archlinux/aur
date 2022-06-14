# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_gen_rec'
pkgname="ocaml-$_projectname"
pkgver='2.0.0'
pkgrel='3'
pkgdesc='A ppx rewriter that transforms a recursive module expression into a `struct`'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml' 'ocaml-ppxlib>=0.18.0')
makedepends=('dune')
checkdepends=('ocaml-ppx_deriving')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d51bc52e32b887f36e671559cf15ddc86b758240b8a244a1b18408bfe4b538b66836e5713875741a23348efacea98f8dfca456f0486b312ac9afd0766c20a9aa')

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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
