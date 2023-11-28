# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=4.0
pkgrel=1
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPL3')
depends=('libreoffice' 'parlatype=3.1')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7ab158a7659e202cd1efd6e2935a0a96857adc35aa32b0066f8963c2e380bcddf18a57248b390c3c7610178ea57bbe045a957a1747e004a1907dc2576dc4f082')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dbundled=true
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
