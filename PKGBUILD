# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom
pkgver=2.0.5
pkgrel=3
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk2-dev' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')
conflicts=('trenchbroom-git')

source=(https://github.com/kduske/TrenchBroom/archive/v${pkgver}.tar.gz)
sha1sums=('de2133545739adb05037c97e38acae493305cca8')

build() {
	tar -zxvf v${pkgver}.tar.gz
	mkdir TrenchBroom-${pkgver}/build
	cd TrenchBroom-${pkgver}/build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_PREFIX=/opt/wxgtk-trenchbroom
	cmake --build . --target TrenchBroom
}

package() {
	cd TrenchBroom-${pkgver}/build
	make DESTDIR=${pkgdir} install
	install -Dm644 "${srcdir}/TrenchBroom-${pkgver}/app/resources/linux/trenchbroom.desktop" "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "${srcdir}/TrenchBroom-${pkgver}/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
