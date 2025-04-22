# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=14
_pkgcommit=efd05f44929e20116c1f3555d5c235407059037a
pkgdesc="An ocaml binding for fuse."
arch=('x86_64')
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
sha256sums=('d0e30bdf125a997c70a1e7d64e4c15580c4dcf0b4e1fa9db70afe46ab4dc1879')

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
