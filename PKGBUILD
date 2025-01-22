# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_jane'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
epoch='1'
pkgdesc='Standard Jane Street ppx rewriters'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base_quickcheck>=0.17.0' 'ocaml-ppx_assert>=0.17.0' 'ocaml-ppx_base>=0.17.0' 'ocaml-ppx_bench>=0.17.0' 'ocaml-ppx_bin_prot>=0.17.0' 'ocaml-ppx_custom_printf>=0.17.0' 'ocaml-ppx_disable_unused_warnings>=0.17.0' 'ocaml-ppx_expect>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_fixed_literal>=0.17.0' 'ocaml-ppx_here>=0.17.0' 'ocaml-ppx_ignore_instrumentation>=0.17.0' 'ocaml-ppx_inline_test>=0.17.0' 'ocaml-ppx_let>=0.17.0' 'ocaml-ppx_log>=0.17.0' 'ocaml-ppx_module_timer>=0.17.0' 'ocaml-ppx_optional>=0.17.0' 'ocaml-ppx_pipebang>=0.17.0' 'ocaml-ppx_sexp_message>=0.17.0' 'ocaml-ppx_sexp_value>=0.17.0' 'ocaml-ppx_stable>=0.17.0' 'ocaml-ppx_stable_witness>=0.17.0' 'ocaml-ppx_string>=0.17.0' 'ocaml-ppx_string_conv>=0.17.0' 'ocaml-ppx_tydi>=0.17.0' 'ocaml-ppx_typerep_conv>=0.17.0' 'ocaml-ppx_variants_conv>=0.17.0' 'ocaml-ppxlib>=0.28.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('cfa5f81e444fa98f89ed1c7488db7d91473266326b9820b5c0647f09930dd6694d2d5d0b5e23640ac42a6d7df2902ce748337444c2758fff1b8c8d3a204d1e20')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
