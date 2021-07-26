# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=terri-fried-git
pkgver=r34.463aa1e
pkgrel=5
pkgdesc="A multi-platform C++ game made for Ludum Dare 46"
arch=('any')
url="https://github.com/polymarsdev/terri-fried"
license=('custom')
depends=('raylib' 'pulseaudio')
makedepends=('git' 'raylib' 'gcc')
source=('terri-fried-git::git+https://github.com/polymarsdev/terri-fried' 'terri-fried' 'terri-fried.desktop')
sha256sums=('SKIP'
            '353e46df9fc1a7b0117a1b6854fdc32fbc773d09dc1cc3b9797edf9b5e8df944'
            '2dff3eb7f21bd5dd7a16b9fc1ed53a4de82df389cd98c0ad28a31af4b7571fec')
pkgver() {
	cd "$srcdir/terri-fried-git"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/terri-fried-git/windows/raylib"
	g++ -c -o player.o $CXXFLAGS player.cpp
	g++ -c -o platform.o $CXXFLAGS platform.cpp
	g++ -c -o main.o $CXXFLAGS main.cpp
	g++ -o terri-fried player.o platform.o main.o -lraylib
}

package() {
	cd "$pkgdir"
	mkdir -p "usr/share/terri-fried/"
	mkdir -p "usr/bin/"
	mkdir -p "usr/share/icons/hicolor/32x32/apps"
	mkdir -p "usr/share/applications"
	cp "$srcdir/terri-fried-git/windows/raylib/terri-fried" "$pkgdir/usr/share/terri-fried/."
	cp -r "$srcdir/terri-fried-git/windows/raylib/resources" "$pkgdir/usr/share/terri-fried/."
	cp "$srcdir/terri-fried" "$pkgdir/usr/bin/."
	cp "$srcdir/terri-fried-git/windows/raylib/resources/egg.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/terri-fried.png"
	cp "$srcdir/terri-fried.desktop"  "$pkgdir/usr/share/applications/."

}
