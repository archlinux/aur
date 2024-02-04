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
            '32d5e9492bd783e3e39097f463f01ff5b9386ca4e54a358c1bb4b58835fe736125d5372ef39a5f7fbdf81c807193858871651f5840e0c3729edfaa9e1a08e705')

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
