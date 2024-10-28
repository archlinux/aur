# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=terrafirma
pkgver=3.1.13
pkgrel=2
pkgdesc='Mapping for Terraria'
arch=(x86_64 aarch64 armv7h)
url='http://seancode.com/terrafirma'
license=(BSD-2-Clause)
depends=(qt6-base)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('fd09c8015d6540eb7be7356d4708c93a76279e679d6ad2e13d1acb412f5e5de6')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	(cd build; make install)
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
