# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom
pkgver=2.0.6
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk2-dev' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')
conflicts=('trenchbroom-git')

source=(https://github.com/kduske/TrenchBroom/archive/v${pkgver}.tar.gz)
sha1sums=('95a7ca3cab04732a329e7f82cfde87df7042db4b')

build() {
	tar -zxvf v${pkgver}.tar.gz
	mkdir TrenchBroom-${pkgver}/build
	cd TrenchBroom-${pkgver}/build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_PREFIX=/usr
	cmake --build . --target TrenchBroom
}

package() {
	cd TrenchBroom-${pkgver}/build
	make DESTDIR=${pkgdir} install
	install -Dm644 "${srcdir}/TrenchBroom-${pkgver}/app/resources/linux/trenchbroom.desktop" "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "${srcdir}/TrenchBroom-${pkgver}/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
