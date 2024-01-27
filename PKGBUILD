# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='time_now'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Reports the current time'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-jane-street-headers>=0.16.0' 'ocaml-jst-config>=0.16.0' 'ocaml-ppx_base>=0.16.0' 'ocaml-ppx_optcomp>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('59c380bc89ac5185e344ef051180270bad62ccc7ad60aec4279aba5f71bae8dae6ac29136a6ca85ad7b24e204615fd84cd7db0901b6550de490e8992301c0ac2')

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
