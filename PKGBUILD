# Maintainer: Wavebox <tom@wavebox.io>
# Contributor: Andrei Marinescu <iandrei.marinescu@gmail.com>

pkgname=wavebox-beta
_pkgver=10.108.17_3
pkgver=10.108.17_3
pkgrel=1
pkgdesc="The next generation of web-desktop communication."
arch=(x86_64)
url="https://wavebox.io"
license=('custom:Wavebox-EULA')
depends=('ttf-liberation' 'libappindicator-gtk3' 'at-spi2-atk' 'cairo' 'libcups' 'gdk-pixbuf2' 'glib2' 'gtk3' 'nspr' 'nss' 'libxss' 'wget' 'xdg-utils')
optdepends=('pam-u2f: Two-Factor Auth')
conflicts=('wavebox-bin' 'wavebox-bin-beta' 'wavebox')
source=("wavebox-$pkgver.tar.gz::https://download.wavebox.app/beta/linux/aur/Wavebox_10.108.17-3_aur.tar.gz"
        'wavebox.appdata.xml'
        'wavebox.menu'
        'LICENSE')
md5sums=('879fb939d5f565bcf5e707e959c163ab'
         '170a7d4e04402fa5c759e8f5e87e9d9c'
         '4f08794ea93eafd0e77b522ac7738638'
         'b92c8854e4553540df6bc998afe68cc4')

prepare() {
	cd "${srcdir}/wavebox_"*
}

package() {
	cd "${srcdir}/wavebox_"*

	install -Dm 644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/wavebox/LICENSE"
	install -Dm 644 ${srcdir}/wavebox.appdata.xml ${pkgdir}/usr/share/appdata/wavebox.appdata.xml
	install -Dm 755 wavebox.desktop ${pkgdir}/usr/share/applications/wavebox.desktop
	install -Dm 644 product_logo_256.png  ${pkgdir}/usr/share/icons/hicolor/256x256/apps/wavebox.png
	install -Dm 644 ${srcdir}/wavebox.menu ${pkgdir}/usr/share/menu/wavebox.menu
	install -dm 755 ${pkgdir}/opt/wavebox.io

	cp -r ../"wavebox_"* ${pkgdir}/opt/wavebox.io/wavebox
}
