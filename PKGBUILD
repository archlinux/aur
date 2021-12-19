# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=3.1.1
pkgrel=1
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPL3')
depends=('libreoffice' 'parlatype=3.0')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('51ec1afb69c6bc0bafa28a2c2799aa75a161653cc22a8b2920c24d881437e618')

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
