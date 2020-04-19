# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boca
_pkgname=BoCA
pkgver=1.0.1
pkgrel=1
pkgdesc="A component library used by the fre:ac audio converter"
arch=('i686' 'x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL2')
depends=('alsa-lib' 'libcdio-paranoia' 'expat' 'libpulse' 'uriparser' 'smooth')
provides=('libboca-1.0.so=2-64' 'freac_cdk')
conflicts=('freac_cdk')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ee01691495c2415e056a30328732b9d486af90f98b71ba0aa6b3f93adf9190c')

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
