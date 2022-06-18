# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: serp <serp 256 at gmail dot com>
_projectname='react'
pkgname="ocaml-$_projectname"
pkgver='1.2.2'
pkgrel='1'
pkgdesc='An OCaml module for functional reactive programming'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('ed3a384ea5ae9b4184a985acf38f3aac009e706537209abf8dd86c2d8d749fff6fe40a6a03e9313dd90723e3ff121c4cb55e344212d54f89c81425ea5e07c594')

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
