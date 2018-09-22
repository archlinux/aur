# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=hexeditor
pkgname=${_pkgname}-git
pkgver=1.4.0.12.ga7a78fb
pkgrel=2
pkgdesc='A cross-platform Hex Editor. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=('git+https://github.com/chipmunk-sm/HexEditor.git')
sha512sums=('SKIP')

pkgver() {
	# Update package version
	cd "${srcdir}"/HexEditor
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Build package
	cd "${srcdir}"/build
	qmake-qt5 ../HexEditor \
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
