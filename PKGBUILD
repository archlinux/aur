# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=5.2.0
pkgrel=2
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('f5fcaef5a963baa344972432e20c9747cba7b08b2dd7beac5c783da250abcde37cf85c23bfb3273432c31b292c9c470c836daf990c69f83bd6c7e565a46859e2'
            'b0703fb555c254bc6098fbb452f13ea176994f9718baf361b71f0324f50658f6c08bff4d58154710c7cfa14622cb6a8dc1a010842c728b0bb55c755606b02c22')
sha256sums=('bb918d67b4fc6fc27634de343069a26c9ad05cf0c1c18cf05add5c821717741e'
            'dc2b49c7a97c3e05f033ff63be9d964bef2a935e1ef0a6210d7304286acf3972')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -G -sbc.banner -sdc.tty_mode
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
