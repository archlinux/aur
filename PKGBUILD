# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>

pkgname=hexeditor
pkgver=1.17.0
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/HexEditor/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6cf8e8e875bec9499b13e6a48ed6b12d628f05aa032f7a8639279d514210588c8c4309471a0f8f45c45bdda551d940d4cda9182d50b42174255c7fcd203e554b')

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
