# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=trenchbroom-git
pkgver=r4578.5df086c
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=('i686' 'x86_64')
url="http://kristianduske.com/trenchbroom"
license=('GPLv3')

makedepends=('git' 'clang' 'pandoc')
depends=('freeimage' 'freetype2' 'wxgtk-trenchbroom' 'mesa' 'libgl' 'freeglut' 'libxxf86vm' 'glew' 'glm')

source=(git://github.com/kduske/TrenchBroom.git#branch=release/v2.0.0
		trenchbroom.desktop)
sha1sums=('SKIP'
		'0ccd7b40ca49b6c81a7ed39e32510c32571b9b1b')

build() {
	cd TrenchBroom
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt -DCMAKE_BUILD_TYPE=Release \
	-DwxWidgets_PREFIX=/usr/include/wx-3.1 .
	cmake --build . --target TrenchBroom
}

pkgver() {
  cd TrenchBroom
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd TrenchBroom
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
	install -Dm644 "./Resources/images/AppIcon.png" "$pkgdir/usr/share/pixmaps/trenchbroom.png"
}
