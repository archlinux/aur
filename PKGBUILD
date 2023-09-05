# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.3.1
pkgrel=2
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
    "$pkgname-$pkgver-$pkgrel.tar.gz::${_src}/releases/download/${pkgver}/AppFlowy_x86_64-unknown-linux-gnu_ubuntu-20.04.tar.gz")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        'd5b229bbae978881abc0ea3edb665ddda510072b448f5ba334aea4b54b91cf7a1a5fb9582c127ec0c34626737920cb7b1038387f02565694c2e7a51d2615f779'
        '2146fd99ede45a74b7b20513e26f6d88745c9f0593df92c4f6925b8eafb432245013027c51d7192ebec61f39ffea7427c6b66e1ca408501d5c7aba00fdb4ae22')
prepare(){
    sed -i 's|/bin/AppFlowy|/bin/appflowy|' AppFlowy.desktop
    sed -i 's|Icon=.*|Icon=/usr/share/appflowy/data/flutter_assets/assets/images/flowy_logo.svg|' AppFlowy.desktop
}

package(){
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 AppFlowy.desktop -t "$pkgdir/usr/share/applications"
	cd AppFlowy
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/AppFlowy" "$pkgdir/usr/bin/$_pkgname"
}

