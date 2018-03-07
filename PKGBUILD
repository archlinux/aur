# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom
pkgver=2.0.2
pkgrel=3
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk-trenchbroom' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')
conflicts=('trenchbroom-git')

source=(https://github.com/kduske/TrenchBroom/archive/v2.0.2.tar.gz)
sha1sums=('b3ac0387b1031f0f0276c7d4f6810301dd71a1e9')

build() {
	tar -zxvf v2.0.2.tar.gz
	mkdir TrenchBroom-2.0.2/build
	cd TrenchBroom-2.0.2/build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_PREFIX=/opt/wxgtk-trenchbroom
	cmake --build . --target TrenchBroom
}

package() {
	cd TrenchBroom-2.0.2/build
	make DESTDIR=${pkgdir} install
	install -Dm644 "${srcdir}/TrenchBroom-2.0.2/app/resources/linux/trenchbroom.desktop" "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "${srcdir}/TrenchBroom-2.0.2/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
