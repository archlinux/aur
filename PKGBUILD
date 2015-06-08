# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=yaze
pkgver=2.30.3
pkgrel=1
license=('GPL')
pkgdesc='Yet Another z80 (CP/M) Emulator'
arch=("i386" "x86_64")
url='http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/'
source=("http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/devel/yaze-ag-2.30.3.tar.gz"
	"yaze.patch")
sha1sums=('f3c162053bb25035cabe5da55a08efa94322fe95'
          'f9a4f8c9500746fd2a470c6f6826b0744e8f414f')

prepare() {
	cd "${srcdir}/${pkgname}-ag-${pkgver}"

	patch -p1 -i $srcdir/yaze.patch
}

build() {
	cd "${srcdir}/${pkgname}-ag-${pkgver}"

	make -f Makefile_linux
}

package() {
	cd "${srcdir}/${pkgname}-ag-${pkgver}"

	make PREFIX="$pkgdir/usr" -f Makefile_linux install
}
