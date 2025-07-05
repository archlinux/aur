# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_tydi'
pkgname="ocaml-$_projectname"
pkgver='0.17.1'
pkgrel='1'
pkgdesc='Let expressions, inferring pattern type from expression'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppxlib>=0.36.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8f7cb408b1dc03be136a3a02f4974bdf5083cd7023cce3171828e0f091cd982a6e778fba8c3c8d58980d28d1f2df8c3e3a7a146dd568551adf318d06f7b87759')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
