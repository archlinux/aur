# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=harbour-shutter-git
pkgver=r73.a9cb88b
pkgrel=1
pkgdesc='A camera application designed for Sailfish which exposes all available camera parameters to the user.'
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-shutter"
branch="main"
license=('GPLv2+')
depends=('qt5-multimedia' 'qt5-quickcontrols' 'qt5-sensors' 'libexif' 'libcamera' 'qt5-quickcontrols2' 'kirigami2' 'opencv')
makedepends=('git' 'qt5-base' 'vtk' 'hdf5' 'glew' 'abseil-cpp' 'fmt')
checkdepends=()
optdepends=()
provides=('harbour-shutter')
conflicts=('harbour-shutter')
replaces=('harbour-shutter')
source=("${pkgname}::git+${url}.git#branch=${branch}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt5 \
		PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}" \
		FLAVOR="kirigami"

	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT="$pkgdir" install
}
