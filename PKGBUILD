# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=5.0.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('3ac4639922398e633aae3c3679ee3e53f3688da3992c55c120165b5718860f9857b7f46c43a9e18da0dd67ac92c8855f7449dfdfdfd11c419dc4ab6683550740'
            '256c04a059efb6bf41a1066ec588de852043ee50e08077f73e2a9f5a9f8369cd87470372acdcb6d8cfee4f5e07c9159145338595b0eee568ba11b2bbf1ce49ec')
sha256sums=('595e803214708d94860d93b53ec7b84eb7bdb0c5c38fa96f5434009f868fe038'
            'dd23aa9931646b360a171187b4bc33dce3faf50395cc4ab7a4c3dffdd096af02')
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
