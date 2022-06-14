# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_jane'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
epoch='1'
pkgdesc='Standard Jane Street ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base_quickcheck>=0.15.0' 'ocaml-ppx_assert>=0.15.0' 'ocaml-ppx_base>=0.15.0' 'ocaml-ppx_bench>=0.15.0' 'ocaml-ppx_bin_prot>=0.15.0' 'ocaml-ppx_custom_printf>=0.15.0' 'ocaml-ppx_disable_unused_warnings>=0.15.0' 'ocaml-ppx_expect>=0.15.0' 'ocaml-ppx_fields_conv>=0.15.0' 'ocaml-ppx_fixed_literal' 'ocaml-ppx_here>=0.15.0' 'ocaml-ppx_ignore_instrumentation>=0.15.0' 'ocaml-ppx_inline_test>=0.15.0' 'ocaml-ppx_let>=0.15.0' 'ocaml-ppx_log>=0.15.0' 'ocaml-ppx_module_timer>=0.15.0' 'ocaml-ppx_optcomp>=0.15.0' 'ocaml-ppx_optional>=0.15.0' 'ocaml-ppx_pipebang>=0.15.0' 'ocaml-ppx_sexp_message>=0.15.0' 'ocaml-ppx_sexp_value>=0.15.0' 'ocaml-ppx_stable>=0.15.0' 'ocaml-ppx_string>=0.15.0' 'ocaml-ppx_typerep_conv>=0.15.0' 'ocaml-ppx_variants_conv>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e594a0caea66e0f976615b2a1db50aad89389888678d9ec7c023b2adb3211817a841a5065de9a65956bde0cb6088ce1b0b3afed6b57b618b9b50e5c07684e3fa')

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
