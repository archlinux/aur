# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=ocamlfuse
pkgver=3.10.0
pkgrel=1
pkgdesc="An ocaml binding for fuse."
arch=('x86_64')
url='https://github.com/astrada/ocamlfuse/'
license=('GPL2')
depends=(
'fuse3>=3.10.0'
'ocaml>=4.08.0'
'camlidl>=1.05'
'ocaml-findlib'
)
makedepends=(
'dune'
'fuse'
)
options=('staticlibs')
source=("$pkgname-$pkgver.zip::https://github.com/astrada/$pkgname/archive/refs/tags/v$pkgver.zip")
sha256sums=('3dfead93d1e5400cb0dc6b154addde9be6d2e69b4e688a8cf2f571d9ce84d88c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Old method
	#cd lib
	#make INCDIRS=/usr/lib/ocaml/camlidl

	dune build @install
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Old method
	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#export OCAMLFIND_INSTFLAGS="-ldconf $srcdir/ld.conf"

	#install -dm 755 "$OCAMLFIND_DESTDIR/Fuse"
	#make -C lib install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
