# Maintainer:
_pkgname=bluestar-manager
pkgname=$_pkgname-bin
pkgver=1.1.4
pkgrel=1
options=(!strip)
pkgdesc="A powerful mod manager for Sonic Racing: CrossWorlds on PC"
arch=(x86_64)
install=bluestar.install
url="https://github.com/Red1Fouad/Crossworlds-mod-manager-RED1"
license=('None')
depends=("libexif" "fuse2" "libgdiplus" "libjpeg-turbo")
optdepends=(
	'steam: for Sonic Racing: CrossWorlds'
	'heroic-games-launcher: for Sonic Racing: CrossWorlds'
	)
source=("$_pkgname-$pkgver.AppImage::$url/releases/download/$pkgver/Bluestar.Manager.V${pkgver}Linux.AppImage"
	"bluestar.desktop"
	"$_pkgname"
	)
sha256sums=("b51ee4394faa31e7f7a26352d35ee26d56e4d0cd895a60094827a8c4fb2b198d"
	"SKIP"
	"SKIP")


package() {
	mkdir -p $pkgdir/opt/Bluestar-Manager
	mkdir -p $pkgdir/usr/bin
	if [[ -d "$srcdir/sqaushfs-root" ]]; then
		rm -rf "$srcdir/squashfs-root"
	fi
	chmod +x "$_pkgname-$pkgver.AppImage"
	./"$_pkgname-$pkgver.AppImage" --appimage-extract
	install -Dm644 $srcdir/squashfs-root/com.bluestar.manager.png $pkgdir/usr/share/icons/hicolor/256x256/apps/com.bluestar.manager.png
	cp -a $srcdir/squashfs-root/bluestar/. $pkgdir/opt/Bluestar-Manager/
	install -Dm644 $srcdir/bluestar.desktop $pkgdir/usr/share/applications/bluestar.desktop
	install -Dm755 -t "$pkgdir/usr/bin" ${_pkgname}
}
