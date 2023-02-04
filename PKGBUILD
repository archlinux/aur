# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core'
pkgname="ocaml-$_projectname"
pkgver='0.15.1'
pkgrel='1'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.11.0' 'ocaml-base>=0.15.1' 'ocaml-base_bigstring>=0.15.0' 'ocaml-base_quickcheck>=0.15.0' 'ocaml-bin_prot>=0.15.0' 'ocaml-fieldslib>=0.15.0' 'ocaml-jane-street-headers>=0.15.0' 'ocaml-jst-config>=0.15.0' 'ocaml-ppx_assert>=0.15.0' 'ocaml-ppx_base>=0.15.0' 'ocaml-ppx_hash>=0.15.0' 'ocaml-ppx_inline_test>=0.15.0' 'ocaml-ppx_jane>=0.15.0' 'ocaml-ppx_sexp_conv>=0.15.0' 'ocaml-ppx_sexp_message>=0.15.0' 'ocaml-sexplib>=0.15.0' 'ocaml-splittable_random>=0.15.0' 'ocaml-stdio>=0.15.0' 'ocaml-time_now>=0.15.0' 'ocaml-typerep>=0.15.0' 'ocaml-variantslib>=0.15.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2c04fdd989d016faaa2dee4b13372d3e228f0011151ae5f747c1eb6206820a61779a87eb7e2ecc6e1ddf77872a69a07636a93d24df61b4a2ba2a1b745f499b16')

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
