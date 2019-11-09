# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=2.3.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('e57b429e3af2afc4e830e7689dfc036bf8f722dacfec34e22e33cae28db6696ff0a9e3245f743d08644324e2e566dd9795b72885b8b44c696e4d9632b4e0aacc'
            'bd170e48e8f56d17f9a4ee5ef86ebd0ea38f420cff3f0dbbb55a359083165d400c72bab3585056651a68575d09e66db6537dc148c8fd71c8473ada48c901ff21')
sha256sums=('5a4d14721688ce0a2679fb02680fe8dc41574417f60647be3a125d53d5672f5d'
            '62b82db46d3cdc8c99862807f41e5e78e5bcbd13d2f844dae17d3e236f815c18')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}
