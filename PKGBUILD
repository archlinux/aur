# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=8
pkgdesc="An ocaml binding for fuse."
arch=('x86_64' 'i686')
url='https://github.com/astrada/ocamlfuse/'
license=('GPL2')
depends=(
'fuse>=2.7'
'ocaml>=3.08'
'camlidl>=1.05'
'ocaml-findlib'
)
makedepends=(
'dune'
'fuse'
)
options=('staticlibs')
source=('https://github.com/astrada/ocamlfuse/archive/master.zip')
sha256sums=('3e610dc52442900aae6b684c1afb0f2b990da10bbceca5413889ed71689a0967')

build() {
	cd "$srcdir/$pkgname-master"

	# Old method
	#cd lib
	#make INCDIRS=/usr/lib/ocaml/camlidl

	dune build @install
}

package() {
	cd "$srcdir/$pkgname-master"

	# Old method
	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#export OCAMLFIND_INSTFLAGS="-ldconf $srcdir/ld.conf"

	#install -dm 755 "$OCAMLFIND_DESTDIR/Fuse"
	#make -C lib install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
