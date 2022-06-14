# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: serp <serp 256 at gmail dot com>
_projectname='react'
pkgname="ocaml-$_projectname"
pkgver='1.2.1'
pkgrel='4'
pkgdesc='An OCaml module for functional reactive programming'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.01.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=0.9.0' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('e760c4504519744b66655be113676cb6e3f016fc8a5c59dca063365223d5d5efc66be3ff2b7a2ad3a745975d1b0aaf37634af699d1a706d3bf3b37c1671e81e3')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
