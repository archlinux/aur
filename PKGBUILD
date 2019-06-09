# Maintainer: Kurobac <kurobac at foxmail dot com>
pkgname=browser360-beta
pkgver=10.0.1008.0
pkgrel=1
pkgdesc="A chromium based web browser from Qihoo 360"
arch=('x86_64')
url="https://browser.360.cn/se/"
license=('custom')
depends=('ca-certificates' 'ttf-liberation' 'gconf' 'libappindicator-gtk3' 'gconf' 'gtk2' 'nss' 'libxss' 'lsb-release' 'wget' 'xdg-utils')
source=('browser360-beta_10.0.1008.0-1_amd64.deb::file://browser360-beta_10.0.1008.0-1_amd64.deb')
DLAGENTS=("file::/usr/bin/echo ${RED} Could not find %u, download at http://bbs.360.cn/thread-15529293-1-1.html to $(pwd)")
sha1sums=('ba69c354fd232257a42a2d98d10d2caafe33511d')

package() {
	cd "${srcdir}"
	tar xf data.tar.xz -C "${pkgdir}"
	# remove crontib
	rm -rf "${pkgdir}"/etc
	rm -rf "${pkgdir}"/opt/360/browser360-beta/cron
	# icons
	for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "${pkgdir}"/opt/360/browser360-beta/product_logo_${i/x*}.png \
			"${pkgdir}"/usr/share/icons/hicolor/$i/apps/${pkgname}.png
			done
	# remove icons
	rm "${pkgdir}"/opt/360/browser360-beta/product_logo_*
}
