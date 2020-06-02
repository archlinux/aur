pkgname=terrafirma
pkgver=3.1
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('75b7c1bf0f8d72384e619cc7e6f73084b0753a7e75f19c8b8fc16a9da18fda82')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	sed -Ei 's/<QObject>/\0\n#include <QMap>/' world.h
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
