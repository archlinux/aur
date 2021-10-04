# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=5.1.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('026e1ba5a8223b80cb8dc6b3a5827d4e1bd0f1708431bbbef43fda2f33c7626785b9ea662f166ea7a2ad0fe56e33918b09565b741d1085613676099ac3291a06'
            '90d5ef3ce0c902a68f3db64c7f44fc670d1ff39e1a429ab90240f54d285315aeb5569bba20223be5b5b423941f19c328d87730e20124ae0046bf1ef9ecb8011e')
sha256sums=('c2783a17ebe1ece88b1fce6f6d51d501a8ce1b6a24f11857503fd500f31397e0'
            'dea566ac55e096d913e094ff07e62932b69c230d81d3cdc4dec27ef9b96a0dd1')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP -sbc.banner -sdc.tty_mode
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
