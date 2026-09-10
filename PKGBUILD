# Contributor: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >
# Maintainer: mcck < m.ckk at tuta dot io >

pkgname=appflowy-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="AppFlowy is the open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.com"
license=('AGPL-3.0-or-later')
provides=('appflowy')
conflicts=('appflowy')
depends=('glib2>=2.80' 'gst-plugins-base-libs' 'gtk3' 'hicolor-icon-theme' 'libkeybinder3' 'libnotify')
optdepends=('kdialog: For file picker on KDE plasma'
	'zenity: bash dialog boxes for file picker')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
	"$_src/raw/$pkgver/LICENSE"
	"$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        '3860a919dc09ce1d84a3b0ce8cffaa507c2eb94b3e8f9fcfdb259140e44b507dbbba943c2d377c271a196533f86422056efb419b9d4b066f8dc7e825e336c98b')

package(){
	cd "$pkgdir"
	tar -xf "$srcdir"/data.tar.xz

	install -Dm644 "$srcdir"/LICENSE -t "usr/share/licenses/appflowy/"
	sed -i "s;Icon=.*;Icon=appflowy;" "usr/share/applications/AppFlowy.desktop"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/icons/hicolor/scalable/apps/appflowy.svg"
	install -d "usr/bin"
	ln -s "/usr/lib/AppFlowy/AppFlowy" -t "usr/bin/"
}
