# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=9
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
source=('https://github.com/astrada/ocamlfuse/archive/master.zip')
sha256sums=('d8a1bfacec0d248a025c4aeed38a039dfc634382b82620998ec58dcce7c29600')

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
