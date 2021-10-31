# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=qdmr-git
pkgver=r515.dab309d
pkgrel=3
pkgdesc="A GUI application for configuring and programming cheap DMR radios"
arch=('x86_64' 'i686')
url="https://github.com/hmatuschek/qdmr"
license=('GPL3')
depends=('libusb' 'qt5-tools' 'qt5-serialport' 'qt5-location' 'yaml-cpp')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('qdmr::git+https://github.com/hmatuschek/qdmr.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i "s#DESTINATION \"/etc#DESTINATION \"${pkgdir}/etc#" lib/CMakeLists.txt
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake . -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install
}
