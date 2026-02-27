# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >
# Maintainer: mcck < m.ckk at tuta dot io >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.11.3
pkgrel=1
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.io"
license=('AGPL-3.0-only')
provides=('appflowy')
conflicts=('appflowy')
depends=('gtk3' 'libkeybinder3' 'libnotify' 'xdg-user-dirs')
optdepends=('kdialog: For file picker on KDE plasma'
	'zenity: bash dialog boxes')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "$_src/raw/$pkgver/LICENSE"
    "$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        '7618150c8aafba9f4b14f70c41211c8d8ce49ab8859307cd6ed55b83b35573579c714771b9c37b71bfb0e3c505e14d375228dba87d0c9a810b825336544044ed')

package(){
    cd "$pkgdir"
    tar -xf "$srcdir"/data.tar.xz
	install -Dm644 "$srcdir"/LICENSE -t "usr/share/licenses/$_pkgname"
    sed -i "s;Icon=.*;Icon=appflowy;" "usr/share/applications/AppFlowy.desktop"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/icons/hicolor/scalable/apps/appflowy.svg"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/pixmaps/appflowy.svg"
    install -dm755 "usr/bin"
  	ln -s "/usr/lib/AppFlowy/AppFlowy" -t "usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
