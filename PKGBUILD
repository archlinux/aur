# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=zutils
pkgver=1.11
pkgrel=2
pkgdesc="Zutils is a collection of utilities able to process any combination of compressed and uncompressed files transparently."
url="https://www.nongnu.org/zutils/zutils.html"
arch=('x86_64')
depends=('gzip-zutils')
makedepends=('lzip' 'bzip2' 'gzip-zutils')
license=('GPL')
source=(
    "https://download.savannah.gnu.org/releases/zutils/$pkgname-$pkgver.tar.lz{,.sig}"
    )
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('2b7171e337bf50806f7e7890558a1eb0cf61e5cff61577713e1749bac682eb6036a5c327d79c6d450df38c30592e0bdbed44b6487020623259610d9181d9d4b5'
            'SKIP')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
