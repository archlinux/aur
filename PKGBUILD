# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=dinotrace
pkgver="9.4f"
pkgrel=1
pkgdesc="X11 waveform viewer with support for VCD, ASCII and other trace formats."
arch=("x86_64" "i686")
url="http://www.veripool.org/projects/dinotrace/"
license=('GPL3')
depends=("xorg-server" "lesstif")
makedepends=("texlive-plaingeneric")
source=("https://github.com/veripool/dinotrace/archive/refs/tags/v${pkgver}.tar.gz" "dinotrace.desktop")
sha512sums=('91e311b604f6c40076059e138c206a2c9182b0aa5ac803a06a242e894fc9778487d3171ec148e50826c1fc454b4a8b31d88dbc6083ff2a5075dc3fc4f1a7c583'
            'e4768197fe2e3fa14f2f53d946a5a426341bcdc7922fb48898f7c6368570bc31df7a3d502b8b100145ddc6aa4b3ed4901013498b8c154ad24ca0feb3aeb91938')

build() {
	cd "$pkgname-$pkgver"
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/dinotrace.desktop" "${pkgdir}/usr/share/applications/"
}
