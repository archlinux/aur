# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=qdmr-git
pkgver=r515.dab309d
pkgrel=1
pkgdesc="A GUI application for configuring and programming cheap DMR radios"
arch=('x86_64' 'i686')
url="https://github.com/hmatuschek/qdmr"
license=('GPL3')
depends=('libusb' 'qt5-tools' 'qt5-serialport' 'qt5-location')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('qdmr::git+https://github.com/hmatuschek/qdmr.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake .
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 src/qdmr "${pkgdir}/usr/bin/qdmr"
	install -Dm 755 cli/dmrconf "${pkgdir}/usr/bin/dmrconf"
}
