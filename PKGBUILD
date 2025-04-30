# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.9.0
pkgrel=1
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.io"
license=('AGPL-3.0-only')
provides=('appflowy')
conflicts=('appflowy')
depends=('gtk3' 'libkeybinder3' 'libnotify' 'xdg-user-dirs')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "$_src/raw/$pkgver/LICENSE"
    "$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        '21f0513d2b95f5c1a035107ccb3b43c42eb41b029b11091c5483fd4eb38e5a39f9420a56f83d9d0a875a5845de20d91c006ba95858a928cd392699dffda3b8ef')

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
