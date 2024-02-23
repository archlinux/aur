# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>

pkgname=ddcui
pkgver=0.5.4
pkgrel=1
pkgdesc='Graphical user interface for ddcutil - control monitor settings'
arch=('i686' 'x86_64')
url='https://github.com/rockowitz/ddcui'
license=('GPL-2.0-or-later')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/rockowitz/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('a20a0f6014c1125392b0da2b3c7f756c3f20f39552d5ae6d64f6256fcdd78242')
depends=(
	'ddcutil>=2.1.3'
	'glib2'
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
		-B "${pkgname}-${pkgver}/build" \
		-S "${pkgname}-${pkgver}" \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \

	cmake --build "${pkgname}-${pkgver}/build"
}

package() {
	cd "${srcdir}"
	DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}/build"
}
