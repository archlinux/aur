# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=juffed
pkgname=${_pkgname}-qt5-git
pkgver=0.10.85.g5ba17f9
pkgrel=3
pkgdesc='A lightweight cross-platform text editor. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='http://juffed.com/'
license=('GPL2')

depends=('enca' 'qscintilla-qt5' 'desktop-file-utils')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-plugins=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("git+https://github.com/Mezomish/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^juffed-//;s/-/./g'
}

prepare() {
	# Make build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=/usr/lib \
		-DUSE_QT5=ON \
		-DUSE_ENCA=ON
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
