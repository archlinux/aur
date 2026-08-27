# Maintainer: Steven Dwy <me@yoplitein.net>

pkgname=trenchbroom-appimage
pkgver=2026.2
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
	"721fe0ad3d7ea5bdfd81c38526105c584fd20abefcbf57d60f843ad751f41ef6"
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
