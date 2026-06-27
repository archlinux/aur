# Maintainer: Jim Madge <jim+aur@jmadge.com>
pkgname=kodi-addon-visualization-matrix
pkgver=21.0.2
_kodiversion="Omega"
pkgrel=1
pkgdesc="Matrix themed visualization addon for Kodi"
arch=('any')
url="https://github.com/xbmc/visualization.matrix"
license=('GPL-2.0-only')
depends=('kodi')
makedepends=(
	'cmake'
	'glm'
	'kodi-dev'
)
source=("https://github.com/xbmc/visualization.matrix/archive/refs/tags/${pkgver}-${_kodiversion}.tar.gz")
sha256sums=('b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0')

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
