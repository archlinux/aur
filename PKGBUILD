# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.6.23
pkgrel=2
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
sha256sums=('f3c2daff748c8df15bf19ef038b6ae075584e273cb231b7f73ab881486d16ead')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Old method requires ocamlbuild instead of jbuilder
	#ocaml setup.ml -configure --prefix /usr --destdir "$pkgdir" --exec-prefix "/usr"
	#ocaml setup.ml -build

	#jbuilder build --debug-backtraces --debug-dependency-path --debug-findlib --no-buffer --verbose @install
	jbuilder build @install
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
    
	jbuilder install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
