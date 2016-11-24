# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=dinotrace
pkgver="9.4e"
pkgrel=1
pkgdesc="X11 waveform viewer with support for VCD, ASCII and other trace formats."
arch=("x86_64" "i686")
url="http://www.veripool.org/projects/dinotrace/"
license=('GPL3')
depends=("xorg-server" "lesstif")
makedepends=()
source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz" "dinotrace.desktop")
sha512sums=('b731fe54e79d879e69ca22da15c1d5d04fe6c517b041818181464b65ea5b37645a97b263ac24b372521bed36b11312117290581012c4713c65ebd0df26d4085a'
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
