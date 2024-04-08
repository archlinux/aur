# Maintainer: Rucker <ruckeraur@proton.me>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: apophys <email@kubikmilan.sk>
# Contributor: kusakata <shohei@kusakata.com>

pkgname=lziprecover
pkgver=1.24
pkgrel=1
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
url="http://www.nongnu.org/lzip/lziprecover.html"
license=('GPL')
arch=('x86_64' 'i686')
source=("https://download.savannah.gnu.org/releases/lzip/lziprecover/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('b1f126fa24b1627c6e98ba8fa4fc30dac248f81f92be12f1063db6e40fd9c6f9f8b5a2306bde72f30623a64de5befec28b34073309f393317b56a38527947466'
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
