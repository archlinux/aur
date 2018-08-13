# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=screencloud
pkgname=${_pkgname}-git
pkgver=1.4.0.0.ged3c4d5
pkgrel=2
pkgdesc='An easy to use screenshot sharing tool. Development version.'
arch=('i686' 'x86_64')
url='https://screencloud.net/'
license=('GPL2')

depends=(
	'qt5-x11extras' 'qt5-svg' 'qt5-multimedia' 'pythonqt'
	'quazip' 'xdg-utils' 'hicolor-icon-theme' 'python2'
)
optdepends=(
	'python2-crypto: for SFTP support'
)
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+https://github.com/olav-st/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g'
}

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	# https://github.com/olav-st/screencloud/issues/322
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_USE_QT5=ON \
		-DPYTHON_USE_PYTHON3=OFF
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
