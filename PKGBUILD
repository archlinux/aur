# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_jane'
pkgname="ocaml-$_projectname"
pkgver='0.13.0'
pkgrel='1'
epoch='1'
pkgdesc='Standard Jane Street ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base_quickcheck>=0.13.0' 'ocaml-ppx_assert>=0.13.0' 'ocaml-ppx_base>=0.13.0' 'ocaml-ppx_bench>=0.13.0' 'ocaml-ppx_bin_prot>=0.13.0' 'ocaml-ppx_custom_printf>=0.13.0' 'ocaml-ppx_expect>=0.13.0' 'ocaml-ppx_fail>=0.13.0' 'ocaml-ppx_fields_conv>=0.13.0' 'ocaml-ppx_here>=0.13.0' 'ocaml-ppx_inline_test>=0.13.0' 'ocaml-ppx_let>=0.13.0' 'ocaml-ppx_module_timer>=0.13.0' 'ocaml-ppx_optcomp>=0.13.0' 'ocaml-ppx_optional>=0.13.0' 'ocaml-ppx_pipebang>=0.13.0' 'ocaml-ppx_sexp_message>=0.13.0' 'ocaml-ppx_sexp_value>=0.13.0' 'ocaml-ppx_stable>=0.13.0' 'ocaml-ppx_typerep_conv>=0.13.0' 'ocaml-ppx_variants_conv>=0.13.0' 'ocaml-ppxlib>=0.9.0')
makedepends=('dune>=1.5.1')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1d49e946babf5f26be5a4b1b4f36bbf3ae3ac5118ca56b1f9adff1dda37d9c3')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
