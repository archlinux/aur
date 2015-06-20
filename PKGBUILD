# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=kdeplasma-applets-gmailfeed-git
_pkgname=gmailfeed
pkgver=v1.1.r2.gf430070
pkgrel=1
pkgdesc="A Plasma 5 plasmoid showing your Gmail feed."
arch=('i686' 'x86_64')
url="https://github.com/anthon38/gmailfeed"
license=('GPL3')
depends=('plasma-framework' 'hicolor-icon-theme' 'knotifications')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install=${pkgname%-*}.install
source=('git://github.com/anthon38/gmailfeed.git')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"

	if [[ -d build ]]; then
	rm -rf build
	fi
	mkdir build && cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "${_pkgname}"/build

	make install DESTDIR="${pkgdir}"
}
