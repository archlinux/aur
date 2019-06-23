# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.7.4
pkgrel=1
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64' 'i686')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.02.3'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.3.6'
'ocaml-sqlite3>=1.6.1'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('staticlibs')
source=("https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2105b7626b03b5775ef4b683fcfd9c11874de669d2bb4ee37eceaa21bb370d69')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Old method requires ocamlbuild instead of jbuilder/dune
	#ocaml setup.ml -configure --prefix /usr --destdir "$pkgdir" --exec-prefix "/usr"
	#ocaml setup.ml -build

	#dune build --debug-backtraces --debug-dependency-path --debug-findlib --no-buffer --verbose @install
	dune build @install
}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#
#	ocaml setup.ml -test
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#ocaml setup.ml -install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    
	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
