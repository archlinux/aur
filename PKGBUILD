# Maintainer: leotheleon <71839579+leo-the-leon@users.noreply.github.com>

pkgname=firealpaca
pkgver=2.9.1
pkgrel=1
pkgdesc="Simple and easy digital painting software"
arch=('i686' 'x86_64')
url="https://firealpaca.com/download"
license=('custom')
depends=('wine')
makedepends=('gendesk' 'icoutils' 'unzip')
source=('firealpaca')
source_i686=("https://firealpaca.com/download/win_zip")
source_x86_64=("https://firealpaca.com/download/win64_zip")
cksums=('1329839102')
cksums_i686=('3382037983')
cksums_x86_64=('2635847309')

prepare() {
	cd "$srcdir"
	_machine=$(uname -m)
	if [[ $(echo $_machine) == 'x86_64' ]]; then
		_win_arch='64'
	else
		_win_arch='32'
	fi
	mv FireAlpacaWin$(echo $_win_arch)_$(echo $pkgver | tr . _) FireAlpaca
	wrestool -x "FireAlpaca/FireAlpaca.exe" -o "icon.ico"
	icotool -x "icon.ico"
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
	--name='FireAlpaca' \
	--mimetype='image/jpeg;image/bmp;image/x-png;image/gif;image/vnd.adobe.photoshop' \
	--categories 'Graphics;2DGraphics;RasterGraphics'
}

package() {
	mkdir -p "$pkgdir/opt/FireAlpaca"
	cp -r "$srcdir/FireAlpaca" "$pkgdir/opt"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/icon_4_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon_3_48x48x32.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon_2_32x32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon_1_16x16x32.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
}
