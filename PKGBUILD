# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=4.2
pkgrel=1
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPL3')
depends=('libreoffice' 'parlatype')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('870291e91166814bbf653adc78f72b494241b0806afdb388a250f94c9fbcaf2cd692c9d986701d8fac59d90f7ff3068ee00d393ab6de077c135288a830ff4c8c')

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
