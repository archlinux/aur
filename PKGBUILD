# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=zutils
pkgver=1.11
pkgrel=3
pkgdesc="Zutils is a collection of utilities able to process any combination of compressed and uncompressed files transparently. Supports bzip2, gzip, lzip, xz, and zstd."
url="https://www.nongnu.org/zutils/zutils.html"
arch=('x86_64')
depends=('gzip-zutils')
#conflicts=('gzip') # See https://aur.archlinux.org/packages/zutils#comment-865937
makedepends=('lzip' 'bzip2' 'gzip-zutils')
license=('GPL')
source=("https://download.savannah.gnu.org/releases/zutils/$pkgname-$pkgver.tar.lz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('2b7171e337bf50806f7e7890558a1eb0cf61e5cff61577713e1749bac682eb6036a5c327d79c6d450df38c30592e0bdbed44b6487020623259610d9181d9d4b5'
            'SKIP')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	echo -e "\e[1;35m  -> \e[0m\e[1mChecks are currently disabled as they currently seem to be unreliable\e[0m"
	cd "$pkgname-$pkgver"
	make -k check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
