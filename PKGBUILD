# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=harbour-shutter-git
pkgver=r63.0d214d7
pkgrel=1
pkgdesc='A camera application designed for Sailfish which exposes all available camera parameters to the user.'
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-shutter"
license=('GPLv2+')
depends=('qt5-multimedia' 'qt5-quickcontrols' 'libexif' 'libcamera')
makedepends=('git' 'qt5-base')
checkdepends=()
optdepends=()
provides=('harbour-shutter')
conflicts=('harbour-shutter')
replaces=('harbour-shutter')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake FLAVOR=kirigami CONFIG+=release PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT="$pkgdir" install
}

