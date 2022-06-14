# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_disable_unused_warnings'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
pkgdesc='Expands [@disable_unused_warnings] into [@warning "-20-26-32-33-34-35-36-37-38-39-60-66-67"]'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('837bb96b5cc2623205ce778e6100d97a0a029e8c20a945509c06ee44784e67b8e9033b5387681c0f86c07f48ca4541e356ca62e19c1baa8d1b52c813400bb024')

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
