# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=qdmr
pkgver=0.10.1
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
sha256sums=('e74cdf7e7ab10c19eca01abf4ff66a9e831eefb9572ca8780170caec0ce002cd')

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
