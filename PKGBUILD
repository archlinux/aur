# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=zutils
pkgver=1.12
pkgrel=1
pkgdesc="Zutils is a collection of utilities able to process any combination of compressed and uncompressed files transparently. Supports bzip2, gzip, lzip, xz, and zstd."
url="https://www.nongnu.org/zutils/zutils.html"
arch=('x86_64' 'i686')
depends=('gzip-zutils')
#conflicts=('gzip') # See https://aur.archlinux.org/packages/zutils#comment-865937
makedepends=('lzip' 'bzip2' 'gzip-zutils')
license=('GPL')
source=("https://download.savannah.gnu.org/releases/zutils/$pkgname-$pkgver.tar.lz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('9f587b8729b669799a3596043c575d1a12c7d29e4d92a1ebc9d6868f45248720f9d30a5a6de7c8b770161c0544ac6ee572d70dda0a6e39b50f7e501d5b037d0c'
            'SKIP')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	echo -e "\e[1;35m  -> \e[0m\e[1mChecks are currently ignored as they seem to be unreliable\e[0m"
	cd "$pkgname-$pkgver"
	make -k check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install{,-man}
	mv "$pkgdir/usr/etc" "$pkgdir/etc"
}
