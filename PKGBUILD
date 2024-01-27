# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_fixed_literal'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Simpler notation for fixed point literals'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-ppxlib>=0.28.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9d83d578fb34b3fb2c5351c3934d5f35e509f66a72ba75126a44362b7e4de07c4d43a33b4eb8630999a7010410a8300c7740cc79bf16609ce1144ad90fc38751')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
