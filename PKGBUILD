# Maintainer: Integral <integral@murena.io>

pkgname=arianna-git
_pkgname=arianna
pkgver=1.1.0.r29.gd80b345
pkgrel=1
epoch=1
pkgdesc="EPub Reader for mobile devices"
groups=('kde-applications-git')
url="https://invent.kde.org/graphics/${_pkgname}.git"
depends=('kquickcharts' 'kirigami-addons' 'hicolor-icon-theme')
arch=('x86_64')
license=('GPL' 'LGPL' 'MIT' 'BSD')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'kfilemetadata' 'qqc2-desktop-style' 'python' 'reuse' 'baloo' 'qt5-websockets' 'qt5-webengine')
provides=('arianna')
conflicts=('arianna')
source=(git+https://invent.kde.org/graphics/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
	mkdir build/
	sed -i 's/0.10//g' "${_pkgname}/CMakeLists.txt"
}

build() {
	cd build/
	cmake -B build/ -S "../${_pkgname}" -DBUILD_TESTING=OFF
	cmake --build build/
}

package() {
	cd build/
	DESTDIR="${pkgdir}" cmake --install build/
}
