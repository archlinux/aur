# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: serp <serp 256 at gmail dot com>
_projectname='react'
pkgname="ocaml-$_projectname"
pkgver='1.2.1'
pkgrel='3'
pkgdesc='An OCaml module for functional reactive programming'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.01.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=0.9.0' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha256sums=('7fc875faba6e4834fb3e8bdc59a997b230dd870cec72ebcf6d08f2df0ac40bfa')

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
