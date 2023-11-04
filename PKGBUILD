# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>

pkgname=ddcui
pkgver=0.4.2
pkgrel=1
pkgdesc='Graphical user interface for ddcutil - control monitor settings'
arch=('i686' 'x86_64')
url='https://www.ddcutil.com/ddcui_main/'
license=('GPL2')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/rockowitz/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('455a291fca82f56a7904745dac05dc4dd572f4f2687627837837e66c4f8f00b2')
depends=(
	'ddcutil>=2.0.0'
	'hicolor-icon-theme'
	'qt5-base'
)
makedepends=(
	'cmake'
	'qt5-tools'
)

build() {
	cd "${srcdir}"

	cmake \
		-B build \
		-S "${pkgname}-${pkgver}" \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \

	cmake --build build
}

package() {
	cd "${srcdir}"
	DESTDIR="${pkgdir}" cmake --install build
}
