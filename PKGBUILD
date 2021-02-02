# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.2.6
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('4b1f43bb0bcd720d2140d41e089aa78fe8d07903fb745ed1a641ffe25fe46f439e480a1e11b687b7555881bd1ee4044c071c50e4bacd579b8909c704db7a6ede'
            '031ceb082537bea132f7a6544987f94a815eb1f63d1dbf1732f987cb8caee8763c2d1137298c5b4ca4d822c3220d147db2e92a1e5406fa33f3d13943a6827948')
sha256sums=('4e664b3f4441fe79e5b0474ca019d23dfd5562e8c6a5efcc3ca08762fb7a1821'
            '38d87ce3fcaf0867f0507f74a1e79ec7978ff18c521984a71581e4b8b68cafc3')
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
