# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=hexeditor
pkgver=1.9.0
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/HexEditor/archive/v${pkgver}.tar.gz")
sha512sums=('109f2e508e5406d2eebbeea66d81bf80be96b3d4e6b4f57ebdcfab8712d0ccd22819f66d350de24b6bfafa8631cf15208e9d538b8542ec960bad84cc454f647d')

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
