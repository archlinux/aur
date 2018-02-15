# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom
pkgver=2.0.0
pkgrel=2
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk-trenchbroom' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')
conflicts=('trenchbroom-git')

source=(https://github.com/kduske/TrenchBroom/archive/v2.0.0-final.tar.gz)
sha1sums=('fb67d59aa66f6f2cd45a76843e2908f6e2c86a21')

build() {
	tar -zxvf v2.0.0-final.tar.gz
	mkdir TrenchBroom-2.0.0-final/build
	cd TrenchBroom-2.0.0-final/build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_PREFIX=/opt/wxgtk-trenchbroom
	cmake --build . --target TrenchBroom
}

package() {
	cd TrenchBroom-2.0.0-final/build
	make DESTDIR=${pkgdir} install
	install -Dm644 "${srcdir}/TrenchBroom-2.0.0-final/app/resources/linux/trenchbroom.desktop" "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "${srcdir}/TrenchBroom-2.0.0-final/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
