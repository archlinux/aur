# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='lwt_log'
pkgname="ocaml-$_projectname"
pkgver='1.1.1'
pkgrel='3'
pkgdesc='Lwt-friendly logger'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-lwt>=4.0.0')
makedepends=('dune')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('14fb19ec61e555e32c8bb026a591c0ce5b0a153663d17b0876178ab92d625f3f')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -Dm644 'COPYING' "$pkgdir/usr/share/doc/$pkgname/COPYING"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
