# Maintainer: Dustin Falgout <dustin@falgout.us>

pkgname=wavebox
pkgver=10.0.54
pkgrel=2
pkgdesc="The next generation of web-desktop communication"
arch=(x86_64)
url="https://wavebox.io"
license=('custom:Wavebox-EULA')
depends=('ttf-liberation' 'libappindicator-gtk3' 'at-spi2-atk' 'cairo' 'libcups' 'gdk-pixbuf2' 'glib2' 'gtk3' 'nspr' 'nss' 'libxss' 'wget' 'xdg-utils')
optdepends=('pam-u2f: Two-Factor Auth')
conflicts=('wavebox-bin' 'wavebox-bin-beta')
source=("$pkgname-$pkgver.tar.gz::http://download.wavebox.app/latest/stable/linux/tar"
        'wavebox.appdata.xml'
        'wavebox.menu'
        'LICENSE')
md5sums=('431ceb9de9b0b3f335f2e14e9f23c49a'
         'cf3416572bcd3e3528958f36306e6e7c'
         '4f08794ea93eafd0e77b522ac7738638'
         'b92c8854e4553540df6bc998afe68cc4')

prepare() {
	cd "${srcdir}/${pkgname}_${pkgver}"
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}"

	install -Dm 644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 ${srcdir}/wavebox.appdata.xml ${pkgdir}/usr/share/appdata/wavebox.appdata.xml
	install -Dm 755 wavebox.desktop ${pkgdir}/usr/share/applications/wavebox.desktop
	install -Dm 644 product_logo_256.png  ${pkgdir}/usr/share/icons/hicolor/wavebox.png
	install -Dm 644 ${srcdir}/wavebox.menu ${pkgdir}/usr/share/menu/wavebox.menu
	install -dm 755 ${pkgdir}/opt/wavebox.io

	cp -r ../"${pkgname}_${pkgver}" ${pkgdir}/opt/wavebox.io/wavebox
}
