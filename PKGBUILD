# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=terri-fried-git
pkgver=r34.463aa1e
pkgrel=11
pkgdesc="A multi-platform C++ game made for Ludum Dare 46"
arch=('x86_64')
url="https://github.com/polymarsdev/terri-fried"
license=('custom')
depends=('raylib' 'pulseaudio')
makedepends=('git' 'raylib' 'gcc')
source=("$pkgname::git+https://github.com/polymarsdev/terri-fried" 'terri-fried' 'terri-fried.desktop')
sha512sums=('SKIP'
            '8d900d1de8c1ea4a4d337dc19664808540e14380cc99a147e4f3cbff3946f20f7db8fb4f3723e84f30703a23ddd704faa6d2c9e83f87ff85e3f6310929ccd9a4'
            'cb435d7f26523d1af1182cd5f4af010c45cb4630133e04155ff806ca500c9e6882ae14ab0319b062aa3686bf72fd9e8569f449eef62571c8e080d7998b9100be')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/windows/raylib"
	CXX=g++
	$CXX -c -o player.o $CXXFLAGS player.cpp
	$CXX -c -o platform.o $CXXFLAGS platform.cpp
	$CXX -c -o main.o $CXXFLAGS main.cpp
	$CXX -o terri-fried player.o platform.o main.o -lraylib
}

package() {
	cd "$pkgdir"
	mkdir -p "usr/share/terri-fried/"
	mkdir -p "usr/bin/"
	mkdir -p "usr/share/icons/hicolor/32x32/apps"
	mkdir -p "usr/share/applications"
	cp "$srcdir/$pkgname/windows/raylib/terri-fried" "$pkgdir/usr/share/terri-fried/."
	cp -r "$srcdir/$pkgname/windows/raylib/resources" "$pkgdir/usr/share/terri-fried/."
	cp "$srcdir/terri-fried" "$pkgdir/usr/bin/."
	cp "$srcdir/$pkgname/windows/raylib/resources/egg.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/terri-fried.png"
	cp "$srcdir/terri-fried.desktop"  "$pkgdir/usr/share/applications/."

}
