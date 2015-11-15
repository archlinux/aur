# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=openspades
pkgver=0.0.12
pkgrel=3
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/yvt.jp/openspades/"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'sdl2' 'sdl2_image')
makedepends=('cmake' 'wget' 'unzip')
install=openspades.install
source=("https://github.com/yvt/openspades/archive/v${pkgver}.tar.gz")
md5sums=('4f459b9e6c6243d2dd8983eb3752b4e4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D OPENSPADES_RESDIR=/usr/share/openspades/Resources -D OPENSPADES_INSTALL_RESOURCES=share/openspades/Resources -D OPENSPADES_INSTALL_BINARY=bin .
	make
}

package() {
	cd "${srcdir}/openspades-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/share/menu"
}

