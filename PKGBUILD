# Maintainer: Jim Madge <jim+aur@jmadge.com>
pkgname=kodi-addon-visualization-matrix
pkgver=20.2.0
_kodiversion="Nexus"
pkgrel=1
pkgdesc="Matrix themed visualization addon for Kodi"
arch=('any')
url="https://github.com/xbmc/visualization.matrix"
license=('GPL2')
depends=('kodi')
makedepends=(
	'cmake'
	'kodi-dev'
)
source=("https://github.com/xbmc/visualization.matrix/archive/refs/tags/${pkgver}-${_kodiversion}.tar.gz")
sha256sums=('f0b76edf45df7161d8525fa2ba623dee64ca66d515342e942100dc46c8220553')

prepare() {
	mkdir -p "${srcdir}/visualization.matrix-${pkgver}-${_kodiversion}/build"
}

build() {
	cd "${srcdir}/visualization.matrix-${pkgver}-${_kodiversion}/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr/share/kodi/addons \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-DPACKAGE_ZIP=1 \
		../
	make
}

package() {
	cd "${srcdir}/visualization.matrix-${pkgver}-${_kodiversion}/build"
	make DESTDIR="$pkgdir/" install
}
