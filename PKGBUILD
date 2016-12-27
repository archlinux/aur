# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom-git
pkgver=r4813.55047553b
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'clang' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk-trenchbroom' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')

source=(git://github.com/kduske/TrenchBroom.git#branch=release/v2.0.0)
sha1sums=('SKIP')

build() {
	mkdir TrenchBroom/build
	cd TrenchBroom/build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release ..
	make -j8
}

pkgver() {
	cd TrenchBroom
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd TrenchBroom/build
	make DESTDIR=${pkgdir} install
	install -Dm644 "$srcdir/TrenchBroom/app/resources/linux/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "$srcdir/TrenchBroom/app/resources/linux/icons/icon_256.png" "$pkgdir/usr/share/pixmaps/trenchbroom.png"
}
