# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>
# Contributor: crave <crave@infinity>
pkgname='ocaml-fileutils'
pkgver='0.6.4'
pkgrel='2'
pkgdesc='OCaml API to manipulate real files and filenames'
arch=('x86_64' 'aarch64')
url="https://github.com/gildor478/$pkgname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.03.0' 'ocaml-seq' 'ocaml-stdlib-shims')
makedepends=('dune>=1.11.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fed41c0c98bd9a2dde18335f0c7fd721b609f936001424eff200bca058146af55134f1d245b143bd211ece37bc036b3308528b193a6b578735b27891181f07e1')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
