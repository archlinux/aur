# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=candle-cnc
pkgver=10.11.1
pkgrel=1
pkgdesc="GRBL controller application with G-Code visualizer written in Qt"
arch=('x86_64')
url="https://github.com/Denvi/Candle"
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'qt5-serialport' 'qt5-tools' 'qt5-websockets')
makedepends=('cmake')
conflicts=('candle-bin' 'candle-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Denvi/Candle/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f90c6dfe8f57a76ef35468920d4372a5c165b52663591c9c144199662b589d05')

build() {
	cmake \
		-B build \
		-S "Candle-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/opt/candle
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/candle/candle "$pkgdir/usr/bin/candle"
	cp -a "Candle-$pkgver/deploy/linux/usr/" "$pkgdir"
}
