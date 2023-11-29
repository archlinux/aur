# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Valerio Pizzi <pival81@yahoo.com>

pkgname=mybsmart
pkgver=7.5.30
pkgrel=1
pkgdesc="Una piattaforma proprietaria di servizi e contenuti digitali per la scuola"
arch=('i686' 'x86_64')
url="https://bsmart.it"
depends=('ffmpeg' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'python-atspi' 'util-linux-libs' 'libsecret')
license=(custom)
source=(LICENSE)
source_i686=(https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v2/linux/MybSmart-$pkgver-ia32.deb)
source_x86_64=(https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v2/linux/MybSmart-$pkgver-x64.deb)
sha256sums=('2ca3e6e7951873c7d82829299181838bb7cacb5c2ad372d7ce752d6d10543b39')
sha256sums_i686=('49ca437ac1cd10de3ae8c1afa6f7d75304516e520d96bf40096f91b49538ff0a')
sha256sums_x86_64=('e029540bafcebe517b3be0d3e3baa0a37f93473d2f5ff7f30ab54654ebb10707')

package() {
	tar -xf data.tar.xz --exclude='./usr/share/doc' -C "$pkgdir"
	mkdir "$pkgdir"/usr/bin
	ln -sf /opt/MybSmart/$pkgname "$pkgdir"/usr/bin/$pkgname
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "$pkgdir"/opt/MybSmart/chrome-sandbox || true
	# https://www.bsmart.it/pages/terminiecondizioni
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
