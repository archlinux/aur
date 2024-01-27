# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='lwt_log'
pkgname="ocaml-$_projectname"
pkgver='1.1.2'
pkgrel='2'
pkgdesc='Lwt-friendly logger'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception' 'BSD-3-Clause')
depends=('ocaml>=4.03.0' 'ocaml-lwt>=4.0.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('fb976d89c0f868b57434a9e0907ffae0842fe48fc747ddb860954d20f36722faea315ebb0b4dac202f9bf7203b0a09681614e9619f3bbd0dd59f8dd7bbd50575')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -Dm644 'COPYING' "$pkgdir/usr/share/doc/$pkgname/COPYING"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
