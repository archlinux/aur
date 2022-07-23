# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=3.1.1
pkgrel=2
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPL3')
depends=('libreoffice' 'parlatype=3.1')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('389bd98341fdebad429f9d6ecf88260383378deb59de451be1e0447c47bd265a9448029871409a224a72f4717307da72cb6f6dc850d6cc32d04087224854034d')

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
