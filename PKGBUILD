# Maintainer: musiclover <musiclover382@protonmail.com>
# Contributor: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=mybsmart
pkgver=7.4.5
pkgrel=1
pkgdesc="Una piattaforma proprietaria di servizi e contenuti digitali per la scuola"
arch=("i686" "x86_64")
url="https://www.bsmart.it"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'python-atspi' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
license=('custom')
source=('LICENSE')
source_i686=("https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v2/linux/MybSmart-$pkgver-ia32.deb")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v2/linux/MybSmart-$pkgver-x64.deb")
sha256sums=('2ca3e6e7951873c7d82829299181838bb7cacb5c2ad372d7ce752d6d10543b39')
sha256sums_i686=('81f0795c27ad4b1c40d2b2d563f19c7deeb6d3c2c86ffa2bad5c4a2f9a61a978')
sha256sums_x86_64=('66f3ed558ad3e7f40c39bf0fb8b3b703724bddcaaa7882e25acbd2d8f7f55e25')

package() {
	tar -xf data.tar.xz --exclude='./usr/share/doc' -C "$pkgdir"

	# Link binary
	mkdir "$pkgdir"/usr/bin
	ln -sf /opt/MybSmart/$pkgname "$pkgdir"/usr/bin/$pkgname
 
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "$pkgdir"/opt/MybSmart/chrome-sandbox || true

	# Install license
	# https://www.bsmart.it/pages/terminiecondizioni
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
