# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Valerio Pizzi <pival81@yahoo.com>

pkgname=mybsmart
pkgver=7.5.31
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
sha256sums_i686=('87fcf55a9175811bab86a4982e3955386db4433d410072ea94469a40588159b1')
sha256sums_x86_64=('fde06080239cfee9ecf9e8baf2a6d37228d7c54c1e16ba9f0defca112ef2509e')

package() {
	tar -xf data.tar.xz --exclude='./usr/share/doc' -C "$pkgdir"
	mkdir "$pkgdir"/usr/bin
	ln -sf /opt/MybSmart/$pkgname "$pkgdir"/usr/bin/$pkgname
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "$pkgdir"/opt/MybSmart/chrome-sandbox || true
	# https://www.bsmart.it/pages/terminiecondizioni
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
