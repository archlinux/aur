# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.5.1
pkgrel=1
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.io"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "$_src/raw/$pkgver/LICENSE"
    "$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        'a88dfe5947ba27c5ee94667496177c29f9439a017cfd5c02800e0abf183f2074e256c16524f496e7b4da6502f1c4a409a9b154ece0e35e248bb9681922811184')

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

