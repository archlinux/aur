# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=dinotrace
pkgver="9.4d"
pkgrel=2
pkgdesc="X11 waveform viewer with support for VCD, ASCII and other trace formats."
arch=("x86_64" "i686")
url="http://www.veripool.org/projects/dinotrace/"
license=('GPL3')
depends=("xorg-server" "lesstif")
makedepends=()
source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz" "dinotrace.desktop")
sha512sums=(
	'3125ede23abf7869c0d79887f6e85321b713c1780491433e63de0e76e6675c4efd6eb9c39006ad92e626bc15cb9b52f79dec6213a696e9455b38091ee8afe178'
	'e4768197fe2e3fa14f2f53d946a5a426341bcdc7922fb48898f7c6368570bc31df7a3d502b8b100145ddc6aa4b3ed4901013498b8c154ad24ca0feb3aeb91938')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/dinotrace.desktop" "${pkgdir}/usr/share/applications/"
}
