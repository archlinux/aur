# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='base_quickcheck'
pkgname="ocaml-$_projectname"
pkgver='0.17.1'
pkgrel='1'
pkgdesc='Randomized testing framework, designed for compatibility with Base'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_base>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_let>=0.17.0' 'ocaml-ppx_sexp_message>=0.17.0' 'ocaml-ppx_sexp_value>=0.17.0' 'ocaml-ppxlib_jane>=0.17.0' 'ocaml-splittable_random>=0.17.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('02ffc2a816a4e84e92d6839777ea429f9f06361ecbc5705481bc6c385a5ce80c04f8eb5d0a34f04838dce983f70a1bb15c20cc5b48917c753cca076fe36a8982')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
