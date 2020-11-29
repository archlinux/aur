# Maintainer: Miha Frangež <miha.frangez at gmail dot com>

_pkgname=ddcui
pkgname=ddcui-git
pkgver=v0.1.2.r0.g46dba4e
pkgrel=1
pkgdesc='ddcui is a beta version of a graphical user interface for ddcutil, implemented using Qt.'
url='https://www.ddcutil.com/ddcui_main/'
license=('GPL2')
source=(
	'git+https://github.com/rockowitz/ddcui'
	ddcui.desktop
)
sha256sums=(
	'SKIP'
	'dfc636ed820339094226fe6b4e9f855206125390a2f2c7e356a54c21008a3033'
)
arch=('i686' 'x86_64')
provides=('ddcui')

depends=(
	'ddcutil-git'
	'qt5-base'
)

makedepends=(
	'git'
	'cmake'
	'qt5-tools'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	cmake \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=release \
		.

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -D -m664 ../ddcui.desktop $pkgdir/usr/share/applications/ddcui.desktop
}
