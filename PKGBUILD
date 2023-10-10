# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.3.5
pkgrel=1
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=('x86_64')
url="https://appflowy.io"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3' 'openssl-1.1')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "${_src}/raw/${pkgver}/LICENSE"
    "${_src}/raw/${pkgver}/frontend/scripts/linux_distribution/deb/AppFlowy.desktop"
    "$pkgname-$pkgver-$pkgrel.tar.gz::${_src}/releases/download/${pkgver}/AppFlowy-$pkgver-linux-$arch.tar.gz")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        '7d56e1feeb7d65ed662d92dcf2fd5e7af2d6cb6823237bce85ffe8c0f07a3b65b043cd01888375f09b9cd2081dd9639d28639f1eff4c447a4728981d9433dd8f'
        '27809a590e13a7277f38f02cc3730901047057585af75665ad7c27913fb0ca9b5a245015c81ccd92475cf39b0989f3ce8932f674b0056ad45ecfb69351fff82d')

package(){
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	cp AppFlowy.desktop AppFlowy-$pkgver.desktop
	sed -i 's;Icon=.*;Icon=appflowy;' AppFlowy-$pkgver.desktop
	install -Dm755 AppFlowy-$pkgver.desktop "$pkgdir/usr/share/applications/AppFlowy.desktop"
	install -Dm644 "AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/appflowy.svg"
	install -Dm644 "AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "$pkgdir/usr/share/pixmaps/appflowy.svg"
	cd AppFlowy
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/AppFlowy" "$pkgdir/usr/bin/$_pkgname"
  	ln -s "/usr/share/$_pkgname/AppFlowy" -t "$pkgdir/usr/bin/"
}

