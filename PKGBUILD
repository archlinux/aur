pkgname=pennywise-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Cross-platform application that allows you to open URLs in a floating window that always stays on top."
arch=('i686' 'x86_64')
url="https://github.com/kamranahmedse/pennywise"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libxss')
optdepends=('chromium: For Open with Pennywise Chrome extension'
			'google-chrome: For Open with Pennywise Chrome Extension'
			'firefox: For Open with Pennywise Firefox Add-on'
			'pepper-flash: for Adobe Flash support in Chromium'
			'flashplugin: for Adobe Flash support in Firefox')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_i686=("https://github.com/kamranahmedse/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("https://github.com/kamranahmedse/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("https://raw.githubusercontent.com/kamranahmedse/${pkgname%-bin}/master/license.md")
sha256sums=('b41ccd76edcf9e9af64581622b1d6dc1de7ed55a96548c4af8c43d32cd764b0b')
sha256sums_i686=('df794adfb3fd28cb68beabe59cadfc000c0b20c83bb38f064d9409a7951b6799')
sha256sums_x86_64=('02d5f5ea3bf0b934d650cbb75c3cb43ab62b3d1c48c733b2f85816ccc8736191')

package() {
	bsdtar -xvf data.tar.xz -C $pkgdir/
	
	# https://github.com/electron/electron/issues/17972#issuecomment-487369441
	chown root $pkgdir/opt/Pennywise/chrome-sandbox
	chmod 4755 $pkgdir/opt/Pennywise/chrome-sandbox
	
	install -d $pkgdir/usr/bin
	ln -sf /opt/Pennywise/${pkgname%-bin} $pkgdir/usr/bin/${pkgname%-bin}
	install -Dm644 license.md $pkgdir/usr/share/licenses/${pkgname%-bin}/license.md
}
