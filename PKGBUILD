# Maintainer: Jim Madge <jim+aur@jmadge.com>
pkgname=kodi-addon-visualization-starburst
pkgver=19.0.1
_kodiversion="Matrix"
pkgrel=1
pkgdesc="StarBurst visualization for Kodi"
arch=('any')
url="https://github.com/xbmc/visualization.starburst"
license=('GPL2')
depends=('kodi')
makedepends=(
	'cmake'
	'kodi-dev'
)
source=("https://github.com/xbmc/visualization.starburst/archive/refs/tags/${pkgver}-${_kodiversion}.tar.gz")
sha256sums=('e2b3ad0473d1ae40c3ecc81f9631c7d956fd4ec3edc7ef43eaeefec242fa79e5')

prepare() {
	mkdir -p "${srcdir}/visualization.starburst-${pkgver}-${_kodiversion}/build"
}

build() {
	cd "${srcdir}/visualization.starburst-${pkgver}-${_kodiversion}/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr/share/kodi/addons \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-DPACKAGE_ZIP=1 \
		../
	make
}

package() {
	cd "${srcdir}/visualization.starburst-${pkgver}-${_kodiversion}/build"
	make DESTDIR="$pkgdir/" install
}
