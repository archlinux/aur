# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='afl-persistent'
pkgname="ocaml-$_projectname"
pkgver='1.4'
pkgrel='1'
pkgdesc='Persistent-mode afl-fuzz for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/stedolan/$pkgname"
license=('MIT')
depends=('ocaml>=4.05.0')
makedepends=('dune>=2.9.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('261bc94ad634fc4441eba02a7d6d011b8e59134d2df4b4ecca3ca4499454d51118fea8f30d84a4043554f7e806da42b5354af283820a7c22920ce26c8f87b8cd')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
