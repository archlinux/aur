# MAINTAINER username227 gfrank227[at]gmail.com
pkgname=trgui-ng
pkgver='1.0.0'
pkgrel=1
pkgdesc='Transmission torrent daemon remote GUI. Remote control GUI for Transmission torrent daemon'
url="https://github.com/openscopeproject/TrguiNG"
arch=('x86_64')
license=('AGPL-3.0')
depends=('alsa-lib' 'cairo' 'desktop-file-utils' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libsoup' 'openssl' 'webkit2gtk')
makedepends=('rust>=1.69.0' 'nodejs>=16.0.0')
source=('git+https://github.com/openscopeproject/TrguiNG')
noextract=('TrguiNG')
sha256sums=('SKIP')
build()	{
	cd "$srcdir/TrguiNG"
	wget -O "$srcdir/TrguiNG/src-tauri/dbip.mmdb" "https://github.com/openscopeproject/TrguiNG/releases/download/v1.0.0/dbip.mmdb" 
	wget -O TrguiNG.desktop "https://raw.githubusercontent.com/flathub/org.openscopeproject.TrguiNG/master/org.openscopeproject.TrguiNG.desktop"
	npm install
	npm run build -- -b
}
package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/lib/trgui-ng"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	install -Dm755 "$srcdir/TrguiNG/src-tauri/target/release/trgui-ng" "$pkgdir/usr/bin/trgui-ng"
	install -Dm755 "$srcdir/TrguiNG/src-tauri/dbip.mmdb" "$pkgdir/usr/lib/trgui-ng/dbip.mmdb"
	install -Dm755 "$srcdir/TrguiNG/TrguiNG.desktop" "$pkgdir/usr/share/applications/TrguiNG.desktop"
	install -Dm755 "$srcdir/TrguiNG/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/trgui-ng.png"
	install -Dm755 "$srcdir/TrguiNG/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/trgui-ng.png"
}
