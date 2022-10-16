# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.7.30
pkgrel=1
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64' 'i686')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.04.0'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.4.2'
'ocaml-sqlite3>=1.6.1'
)
makedepends=(
'dune'
'ocaml-ounit'
)
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3fe3f0d4051f1a81e37f6da9e8a492eb3c81f7450c6b43fee81a7fd94249bfa0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

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
	cd ${srcdir}/${pkgname}-${pkgver}

	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#ocaml setup.ml -install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    
	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
