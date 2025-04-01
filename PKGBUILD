# Maintainer: Tuneful <tuneful "dot" su "at" yandex "dot" com>

pkgname=yunhu
pkgver=1.5.33
pkgrel="1"
pkgdesc="yunhu-1.55.33 for Linux (Commercial software, please refer to the license terms.)"
arch=('x86_64')
url="https://chat-web-go.jwzhd.com"
license=('proprietary')
depends=(
	libayatana-appindicator
	mpv
	jq
)
source=("https://app-cdn1.jwznb.com/linux/yunhu-linux-1.5.33.tar.gz")
sha256sums=('5adb057146a8661c1f54bf6c6c85fc40fbe465b314a02bf4a2d535ad088f1366')

package() {
	export LD_PRELOAD=/usr/lib/libfakeroot/libfakeroot.so
    cd "$srcdir"
	mkdir -p "$pkgdir/opt/"
    tar -xzvf "yunhu-linux-1.5.33.tar.gz" -C "$pkgdir/opt/"
    mv "$pkgdir/opt/yunhu-linux-1.5.33" "$pkgdir/opt/yunhu/"
	if [[ ! -d /usr/share/icons/hicolor/320x320 ]]; then
		sudo mkdir -p /usr/share/icons/hicolor/320x320/app
	fi

	echo "[Desktop Entry]
Type=Application
Version=1.5.33
Name=yunhu
Name[zh_CN]=云湖
Icon=/usr/share/icons/hicolor/320x320/app/yunhu.png
Exec=/opt/yunhu/yunhu %U
Categories=Social;
Keywords=云湖;聊天;社交;软件;
StartupNotify=true" > yunhu.desktop

	install -Dm644 "$srcdir/yunhu.desktop" "$pkgdir/usr/share/applications/yunhu.desktop"
	install -Dm644 "$pkgdir/opt/yunhu/data/flutter_assets/images/appIcon/icon_original.png" $pkgdir/usr/share/icons/hicolor/320x320/app/yunhu.png
}
