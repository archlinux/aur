# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=hexeditor
pkgver=1.11.0
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/HexEditor/archive/v${pkgver}.tar.gz")
sha512sums=('ba62636e9ae3ca6f95cd081b226c803a6f900130c1137ec9c418c587740442c091100fda8842a0c957ab39bda37d10b4b7c08608869724bfe39c4a736c9cf94f')

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
