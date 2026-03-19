# Maintainer: Steven Dwy <me@yoplitein.net>

pkgname=trenchbroom-appimage
pkgver=2025.4
pkgrel=1
pkgdesc="Cross-platform level editor for Quake-engine based games. AppImage version"
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=("GPL3")
provides=("trenchbroom")
source=(
	"https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/TrenchBroom-Linux-$CARCH-v$pkgver-Release.zip"
	"TrenchBroom-appimage.desktop"
)
sha256sums=(
	"81d10ea077e4acb59696ad742225e11e885a28862bac6e1c1a5fd509c8e1bbf3"
	"SKIP"
)

options=(
	!debug
	!strip # stripping seems to nuke AppImage data
)

prepare() {
	local iconPath="usr/share/icons/hicolor/256x256/apps/trenchbroom.png"
	./TrenchBroom.AppImage --appimage-extract "$iconPath"
	mv "squashfs-root/$iconPath" .
}

package() {
	install -Dm755 TrenchBroom.AppImage "$pkgdir/usr/lib/TrenchBroom.AppImage"
	install -Dm644 TrenchBroom-appimage.desktop "$pkgdir/usr/share/applications/TrenchBroom-appimage.desktop"
	install -Dm644 trenchbroom.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/trenchbroom-appimage.png"
}
