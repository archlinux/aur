# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: apophys <email@kubikmilan.sk>
# Contributor: kusakata <shohei@kusakata.com>

pkgname=lziprecover
pkgver=1.23
pkgrel=2
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
url="http://www.nongnu.org/lzip/lziprecover.html"
license=('GPL')
arch=('x86_64' 'i686')
source=("https://download.savannah.gnu.org/releases/lzip/lziprecover/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('9f2d40311f901c2c00fa6b106a2363dfcd7b6c73ae86282733d7c3451237ee30f6d5cce035ab5ba63300eea637eeb3ac5db7e7571bdef1bef259b801b10f1c7a'
            'SKIP')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "${srcdir}/lziprecover-${pkgver}"
	make DESTDIR="$pkgdir" install{,-man}
}
