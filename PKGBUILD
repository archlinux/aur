# Maintainer: Wavebox <tom@wavebox.io>
# Contributor: Andrei Marinescu <iandrei.marinescu@gmail.com>

pkgname=wavebox-beta
_pkgver=10.0.532_4
pkgver=10.0.532_4
pkgrel=1
pkgdesc="The next generation of web-desktop communication."
arch=(x86_64)
url="https://wavebox.io"
license=('custom:Wavebox-EULA')
depends=('ttf-liberation' 'libappindicator-gtk3' 'at-spi2-atk' 'cairo' 'libcups' 'gdk-pixbuf2' 'glib2' 'gtk3' 'nspr' 'nss' 'libxss' 'wget' 'xdg-utils')
optdepends=('pam-u2f: Two-Factor Auth')
conflicts=('wavebox-bin' 'wavebox-bin-beta' '{{channel_conflict}}')
source=("$pkgname-$pkgver.tar.gz::https://download.wavebox.app/canary/linux/aur/Wavebox_10.0.532-4_aur.tar.gz"
        'wavebox.appdata.xml'
        'wavebox.menu'
        'LICENSE')
md5sums=('3766060a43a9e9d1476fea03cbc048da'
         '170a7d4e04402fa5c759e8f5e87e9d9c'
         '4f08794ea93eafd0e77b522ac7738638'
         'b92c8854e4553540df6bc998afe68cc4')

prepare() {
	cd "${srcdir}/${pkgname}_"*
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

package() {
	cd "${srcdir}/${pkgname}_"*

	install -Dm 644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 ${srcdir}/wavebox.appdata.xml ${pkgdir}/usr/share/appdata/wavebox.appdata.xml
	install -Dm 755 wavebox.desktop ${pkgdir}/usr/share/applications/wavebox.desktop
	install -Dm 644 product_logo_256.png  ${pkgdir}/usr/share/icons/hicolor/256x256/apps/wavebox.png
	install -Dm 644 ${srcdir}/wavebox.menu ${pkgdir}/usr/share/menu/wavebox.menu
	install -dm 755 ${pkgdir}/opt/wavebox.io

	cp -r ../"${pkgname}_"* ${pkgdir}/opt/wavebox.io/wavebox
}
