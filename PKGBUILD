# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom
pkgver=2019.3
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=("i686" "x86_64")
url="http://kristianduske.com/trenchbroom"
license=("GPLv3")

makedepends=("git" "pandoc")
depends=("freeimage" "freetype2" "wxgtk2-tb" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm")

source=("git+https://github.com/kduske/TrenchBroom.git#tag=v${pkgver}"
	trenchbroom.desktop)
sha1sums=(SKIP
	"34e2e1168624a61358c01cecfad170d435952740")

build() {
	mkdir TrenchBroom/build
	cd TrenchBroom/build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_PREFIX=/opt/wxgtk2-tb
	cmake --build . --target TrenchBroom
}

package() {
	cd TrenchBroom/build
	make DESTDIR=${pkgdir} install
	install -Dm644 ../../../trenchbroom.desktop "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "${srcdir}/TrenchBroom/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
