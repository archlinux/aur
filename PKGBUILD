# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library"
# If you're running on aarch64, you have to add it to the arch array of the ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-base_bigstring>=0.16.0' 'ocaml-base_quickcheck>=0.16.0' 'ocaml-bin_prot>=0.16.0' 'ocaml-fieldslib>=0.16.0' 'ocaml-jane-street-headers>=0.16.0' 'ocaml-jst-config>=0.16.0' 'ocaml-ppx_assert>=0.16.0' 'ocaml-ppx_base>=0.16.0' 'ocaml-ppx_hash>=0.16.0' 'ocaml-ppx_inline_test>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-ppx_optcomp>=0.16.0' 'ocaml-ppx_sexp_conv>=0.16.0' 'ocaml-ppx_sexp_message>=0.16.0' 'ocaml-sexplib>=0.16.0' 'ocaml-splittable_random>=0.16.0' 'ocaml-stdio>=0.16.0' 'ocaml-time_now>=0.16.0' 'ocaml-typerep>=0.16.0' 'ocaml-variantslib>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2483cec4f5c5984203fc203b121bf1236cf8dff3713dba3fe127a419cc397179ad0b7cb4d1e5072e8dc155ec8a20d5d9aa6a112db1e24e68a11536a54f6819a1')

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
