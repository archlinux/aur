# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: malet <malet@invalid>
_projectname='visitors'
pkgname="ocaml-$_projectname"
pkgver='20210608'
pkgrel='3'
pkgdesc='An OCaml syntax extension for generating visitor classes'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.inria.fr/fpottier/$_projectname"
license=('LGPL2.1')
depends=('ocaml>=4.05.0' 'ocaml-ppx_deriving>=5.0' 'ocaml-ppxlib>=0.22.0' 'ocaml-result')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$_projectname-$pkgver.tar.gz")
sha512sums=('3abecb822dd37511421264d98868c937b7e81f209391e70cc66b7a4663aa059848a3f0ffe9de15408cb0b2112828118ef477a8b2ebf78d6323a4775eff31c055')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
