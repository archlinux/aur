# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_cold'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
pkgdesc='Expands [@Cold] into [@inline never][@specialise never][@Local never]'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('239b78e8c03d47973be4d72d4879a0290367f96033b9d3a5d723a1c35e02121af86d5e41fd08dcf4746a8c6d521c94cf41eff6b4a439a204e0a5a3a0c49d9bf1')

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
