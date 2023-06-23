# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=terrafirma
pkgver=3.1.12
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=(x86_64 aarch64 armv7h)
url='http://seancode.com/terrafirma'
license=(BSD)
depends=(qt6-base)
makedepends=(cmake)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz"
	"fix-install-paths.patch::https://github.com/mrkite/TerraFirma/commit/6d2c535440f5a8104d0cb4ae2a7ead8c472fde77.patch"
)
sha256sums=('074342b7f3862ce0d2ebe1c876b94b5688f7ab053110519ef6d02ad4755a7469'
            'e5a4458f577031b4a65f595038ba765243bf86de2d59982e6e5d2a769e861ebb')

prepare() {
	cd "$srcdir/TerraFirma-$pkgver"
	patch -p1 < "$srcdir/fix-install-paths.patch"
	mkdir -p build
}

build() {
	cd "$srcdir/TerraFirma-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	(cd build; make install)
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
