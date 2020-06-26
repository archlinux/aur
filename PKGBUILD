# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=10
_pkgcommit=2c9fb2079b3ff59898d871ceb38dc71275efd70a
pkgdesc="An ocaml binding for fuse."
arch=('x86_64' 'i686')
url='https://github.com/astrada/ocamlfuse/'
license=('GPL2')
depends=(
'fuse>=2.7'
'ocaml>=4.02.3'
'camlidl>=1.05'
'ocaml-findlib'
)
makedepends=(
'dune'
'fuse'
)
options=('staticlibs')
source=("https://github.com/astrada/ocamlfuse/archive/$_pkgcommit.zip")
sha256sums=('47895d1d8c8ac362732ab75ff1a5a1db898f67ae570aad4399ea5528c73da612')

build() {
	cd "$srcdir/$pkgname-$_pkgcommit"

	# Old method
	#cd lib
	#make INCDIRS=/usr/lib/ocaml/camlidl

	dune build @install
}

package() {
	cd "$srcdir/$pkgname-$_pkgcommit"

	# Old method
	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#export OCAMLFIND_INSTFLAGS="-ldconf $srcdir/ld.conf"

	#install -dm 755 "$OCAMLFIND_DESTDIR/Fuse"
	#make -C lib install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
