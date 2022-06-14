# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_log'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
pkgdesc='Ppx_sexp_message-like extension nodes for lazily rendering log messages'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-ppx_here>=0.15.0' 'ocaml-ppx_sexp_conv>=0.15.0' 'ocaml-ppx_sexp_message>=0.15.0' 'ocaml-sexplib>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1585f82615def2fc1c94853e9a1b9e3ebd2ef8193067f229f24580ea124c06736a2b361377801b9a44b7347e1938da051ed652764142e2270de3d3e8f375bf46')

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
