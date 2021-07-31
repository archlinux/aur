# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_jane'
pkgname="ocaml-$_projectname"
pkgver='0.14.0'
pkgrel='3'
epoch='1'
pkgdesc='Standard Jane Street ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base_quickcheck>=0.14.0' 'ocaml-ppx_assert>=0.14.0' 'ocaml-ppx_base>=0.14.0' 'ocaml-ppx_bench>=0.14.0' 'ocaml-ppx_bin_prot>=0.14.0' 'ocaml-ppx_custom_printf>=0.14.0' 'ocaml-ppx_expect>=0.14.0' 'ocaml-ppx_fields_conv>=0.14.0' 'ocaml-ppx_fixed_literal' 'ocaml-ppx_here>=0.14.0' 'ocaml-ppx_inline_test>=0.14.0' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppx_module_timer>=0.14.0' 'ocaml-ppx_optcomp>=0.14.0' 'ocaml-ppx_optional>=0.14.0' 'ocaml-ppx_pipebang>=0.14.0' 'ocaml-ppx_sexp_message>=0.14.0' 'ocaml-ppx_sexp_value>=0.14.0' 'ocaml-ppx_stable>=0.14.0' 'ocaml-ppx_string>=0.14.0' 'ocaml-ppx_typerep_conv>=0.14.0' 'ocaml-ppx_variants_conv>=0.14.0' 'ocaml-ppxlib>=0.11.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fc0d1aaa9ff120eef1eeed5c2fcfb406b27c6ef865439dfeac38cce181d0c771')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
