# Maintainer: Jim Madge <jim+aur@jmadge.com>
pkgname=kodi-addon-visualization-starburst
pkgver=20.2.0
_kodiversion="Nexus"
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
sha256sums=('0d63b38ba8d5b3bac542546b1ecfb7d722b79652da485d75b22086e26ef4f825')

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
