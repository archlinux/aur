# Maintainer:
_pkgname=bluestar-manager
pkgname=$_pkgname-bin
pkgver=1.1.6
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
sha256sums=("5d79dab51dccbac675f2db4439393c6c9ae2efa28cc62aef54e35fa64f1676b3"
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
