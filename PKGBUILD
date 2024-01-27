# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_jane'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='Standard Jane Street ppx rewriters'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base_quickcheck>=0.16.0' 'ocaml-ppx_assert>=0.16.0' 'ocaml-ppx_base>=0.16.0' 'ocaml-ppx_bench>=0.16.0' 'ocaml-ppx_bin_prot>=0.16.0' 'ocaml-ppx_custom_printf>=0.16.0' 'ocaml-ppx_disable_unused_warnings>=0.16.0' 'ocaml-ppx_expect>=0.16.0' 'ocaml-ppx_fields_conv>=0.16.0' 'ocaml-ppx_fixed_literal>=0.16.0' 'ocaml-ppx_here>=0.16.0' 'ocaml-ppx_ignore_instrumentation>=0.16.0' 'ocaml-ppx_inline_test>=0.16.0' 'ocaml-ppx_let>=0.16.0' 'ocaml-ppx_log>=0.16.0' 'ocaml-ppx_module_timer>=0.16.0' 'ocaml-ppx_optional>=0.16.0' 'ocaml-ppx_pipebang>=0.16.0' 'ocaml-ppx_sexp_message>=0.16.0' 'ocaml-ppx_sexp_value>=0.16.0' 'ocaml-ppx_stable>=0.16.0' 'ocaml-ppx_stable_witness>=0.16.0' 'ocaml-ppx_string>=0.16.0' 'ocaml-ppx_tydi>=0.16.0' 'ocaml-ppx_typerep_conv>=0.16.0' 'ocaml-ppx_variants_conv>=0.16.0' 'ocaml-ppxlib>=0.28.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8bb5997eb33a2f8ef7ec88d5a31c03828cc6f7070641463ad5af318b865fe8638b1affa359db07e8880364598b43ad19621882cf4c3311e38cf0638a59271652')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
