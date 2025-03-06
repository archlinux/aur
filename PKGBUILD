pkgname=trenchbroom-appimage
pkgver=2025.2
pkgrel=1
arch=("x86_64")
license=("GPL3")
provides=("trenchbroom")
source=(
	"https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/TrenchBroom-Linux-$CARCH-v$pkgver-Release.zip"
	"TrenchBroom-appimage.desktop"
)
sha256sums=(
	"5cabe0cd45d92a81a7dba15ffeda8e9ddb79918dc547112cc532b5a7f8c8bf13"
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
