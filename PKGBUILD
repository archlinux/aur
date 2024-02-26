# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=13
_pkgcommit=d38ba9cbd046c15f678323375e76537c1b6242a3
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
source=("$pkgname-$pkgver.zip::https://github.com/astrada/$pkgname/archive/$_pkgcommit.zip")
sha256sums=('0a79ab982b2f37194673881f46a944e3505c1147ffd28003ef55db973c174c41')

build() {
	cd ${srcdir}/${pkgname}-${_pkgcommit}

	# Old method
	#cd lib
	#make INCDIRS=/usr/lib/ocaml/camlidl

	dune build @install
}

package() {
	cd ${srcdir}/${pkgname}-${_pkgcommit}

	# Old method
	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#export OCAMLFIND_INSTFLAGS="-ldconf $srcdir/ld.conf"

	#install -dm 755 "$OCAMLFIND_DESTDIR/Fuse"
	#make -C lib install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
