# Maintainer: Jorge Barroso <jorge_barroso_11 at hotmail dot com>
_pkgname=harvesttimer-qt
_appname=harvest
pkgname=harvest-timer-qt
pkgver=1.0.6
pkgrel=1
pkgdesc='Desktop app for Harvest, a simple time tracker and reporting tool for companies'
arch=('x86_64')
url='https://github.com/jorge-barroso/harvesttimer-qt'
license=('GPL3')
provides=('harvest-timer')
conflicts=('harvest-timer')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
apptag="v${pkgver}"
install="${pkgname}.install"
source=(
	"https://github.com/jorge-barroso/${_pkgname}/archive/refs/tags/${apptag}.tar.gz"
)
srcdir_name="${_pkgname}-${pkgver}"
sha256sums=('3c264eb8cd09ca497370987bf623f7b4e168b31c12a8215df539e79f99ee62d1')

build() {
	cd "${srcdir}"

	mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"

	cmake "../${srcdir_name}/" -DCMAKE_INSTALL_PREFIX=/usr

	make || return 1
}

package() {
	cd "${srcdir}/build"

	make DESTDIR="$pkgdir/" install || return 1
}
