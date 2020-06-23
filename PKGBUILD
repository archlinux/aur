# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=2.1
pkgrel=1
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPL3')
depends=('libreoffice' 'parlatype=2.1')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e514016faa0a6871fe9a7d561d206e2cbe4bf514da180a6c5a112621716662f0')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix=/usr -Dbundled=true
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
