# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=qdmr
pkgver=0.10.3
pkgrel=1
pkgdesc="A GUI application for configuring and programming cheap DMR radios"
arch=('x86_64' 'i686')
url="https://github.com/hmatuschek/qdmr"
license=('GPL3')
depends=('libusb' 'qt5-tools' 'qt5-serialport' 'qt5-location' 'yaml-cpp')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("qdmr-$pkgver.tar.gz::https://github.com/hmatuschek/qdmr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bddca5e4d35811f40170c3031408ac6141023adaa80754b707b7f71068dc816')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	sed -i "s#DESTINATION \"/etc#DESTINATION \"${pkgdir}/etc#" lib/CMakeLists.txt
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cmake . -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
