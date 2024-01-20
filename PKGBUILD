# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>

pkgname=ddcui
pkgver=0.5.0
pkgrel=1
pkgdesc='Graphical user interface for ddcutil - control monitor settings'
arch=('i686' 'x86_64')
url='https://github.com/rockowitz/ddcui'
license=('GPL-2.0')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/rockowitz/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('162680ad3d15e568b10e1d7f5db6474f4ba73659299647b2513af701ffaee1ad')
depends=(
	'ddcutil>=2.1.0'
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
