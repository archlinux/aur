# Contributor: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >
# Maintainer: mcck < m.ckk at tuta dot io >

pkgname=appflowy-bin
pkgver=0.13.0
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
        '094678bd49cc4adec71186a2322c66142d2247b976217e94c04b8aed74cfc51a92d9cae2b473432b275d543ff0bf8d9ed3ae4b80afe3b465beb448841e0d0e4a')

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
