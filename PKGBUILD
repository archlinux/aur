# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=hexeditor
pkgver=1.5.0
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/HexEditor/archive/v${pkgver}.tar.gz")
sha512sums=('8beeba353329ef0dd96272d11f051821fbb209b2c70e208a63f2ebb5933a94b6edc4b1190f16a09d673e0ad43da85e5a1670f65ccbae5413e7b64b7f35606b64')

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Build package
	cd "${srcdir}"/build
	qmake-qt5 ../HexEditor-${pkgver} \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	# Install package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
