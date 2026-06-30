# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=eez-studio-bin
_pkgname=eezstudio
pkgver=0.28.0
pkgrel=1
pkgdesc="Cross-platform low-code GUI and automation (Prebuilt binary)"
arch=("x86_64")
url="https://github.com/eez-open/studio"
license=('GPL-3.0-only')
options=(!strip)
conflicts=("eez-studio-appimage")
depends=(
    'nss'
    'atkmm'
    'cups'
    'gtk3'
    'alsa-lib'
    'python'
)
source=("https://github.com/eez-open/studio/releases/download/v$pkgver/$_pkgname-$pkgver.x86_64.rpm")
sha256sums=("b89de893ec63938c122d3dc8dd84c5c31054615fa8288b6fe63a8761259f4968")
package() {
		pkgname_pretty="EEZ Studio"
        install -d "$pkgdir/opt/$pkgname_pretty"
		cp -Pr --no-preserve=ownership "$srcdir/opt/$pkgname_pretty/" "$pkgdir/opt/" 

		install -d "$pkgdir/usr/share"
		install -Dm644 "$srcdir/usr/share/applications/$pkgname_pretty.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
		_icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    	for _icons in "${_icon_sizes[@]}";do
        	install -Dm644 "$srcdir/usr/share/icons/hicolor/$_icons/apps/$pkgname_pretty.png" \
    			 "$pkgdir/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png"
    	done
    
    	install -d "$pkgdir/usr/share/mime/packages"
    	install -Dm644 "$srcdir/usr/share/mime/packages/$pkgname_pretty.xml" "$pkgdir/usr/share/mime/packages/$_pkgname.xml"
}
