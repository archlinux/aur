# Maintainer: effeffe <filippo.falezza at outlook dot com>

pkgname=muparser-aur
pkgver=2.2.6.1
pkgrel=1
pkgdesc="muparser - Fast Math Parser Library"
# more info in: https://beltoforion.de/article.php?a=muparser
arch=('i686' 'x86_64')
url="muparser.beltoforion.de"
depends=('gcc-libs')
provides=('muparser')
source=("https://github.com/beltoforion/muparser/archive/v2.2.6.1.tar.gz")
sha256sums=('d2562853d972b6ddb07af47ce8a1cdeeb8bb3fa9e8da308746de391db67897b3')
install=".INSTALL"

prepare() {
	cd "$srcdir"
	tar -xf v${pkgver}.tar.gz
}

build() {
	cd "$srcdir/muparser-${pkgver}"
	./configure --enable-shared=yes --enable-samples=yes --enable-debug=yes
	make
}
package() {
	cd "$srcdir/muparser-${pkgver}"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/"etc/ld.so.conf.d
	echo "/usr/local/lib" >> "$pkgdir/"etc/ld.so.conf.d/1-local.conf
}
