# Maintainer: tequa
pkgname=covered
pkgver=0.7.10
pkgrel=3
epoch=
pkgdesc="Verilog Code Coverage Analyzer"
arch=('x86_64' 'i686')
url="http://covered.sourceforge.net/"
license=('GPL')
groups=()
depends=('tcl' 'tk' 'tablelist')
makedepends=('gcc' 'flex' 'bison' 'make' 'gperf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/covered/files/${pkgname}-stable/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}_fixes.patch")
noextract=()
md5sums=("7f79e93471546810b166e9104236bda2"
	 "c90ca06190073dec91cc8a0f591dde6a")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/${pkgname}_fixes.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	rmdir ${pkgdir}/usr/libexec
}
