# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boca
_pkgname=BoCA
pkgver=1.0.2
pkgrel=1
pkgdesc="A component library used by the fre:ac audio converter"
arch=('i686' 'x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL2')
depends=('alsa-lib' 'libcdio-paranoia' 'expat' 'libpulse' 'uriparser' 'smooth')
provides=('libboca-1.0.so=2-64' 'freac_cdk')
conflicts=('freac_cdk')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f5d4432674242f1fcb18a7d9da247ca0da00249858e24cb301f0d213019a6fd5')

prepare() {
	cd "$_pkgname-$pkgver"
	find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

	sed -i 's/FOLDERS += coreaudioconnect/#FOLDERS += coreaudioconnect/g' \
		components/encoder/Makefile
}

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
