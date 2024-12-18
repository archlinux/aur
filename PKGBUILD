# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.7.8
pkgrel=1
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.io"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3' 'libnotify')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "$_src/raw/$pkgver/LICENSE"
    "$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        'f47a6c55c2c4d3fc366ed620ee8e8ced7235fd1f044e68732f9076346e35d4c0f92ec5c487ee141a8ab307df13c6049044caa38039eac4ba092a7cbe2f593469')

package(){
    cd "$pkgdir"
    tar -xf "$srcdir"/data.tar.xz
	install -Dm644 "$srcdir"/LICENSE -t "usr/share/licenses/$_pkgname"
    sed -i "s;Icon=.*;Icon=appflowy;" "usr/share/applications/AppFlowy.desktop"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/icons/hicolor/scalable/apps/appflowy.svg"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/pixmaps/appflowy.svg"
    mkdir usr/bin
  	ln -s "/usr/lib/AppFlowy/AppFlowy" -t "usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
