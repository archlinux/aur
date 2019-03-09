# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=hexeditor
pkgver=1.6.0
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/HexEditor/archive/v${pkgver}.tar.gz")
sha512sums=('44dc75688157b2c457dd1e3ebe44cad990a11274ac4ca9f180d6c6c022af317266a3bd6499955e62f5bc1f672024c4782f529fe98ee09262605509e1e7bff77d')

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
