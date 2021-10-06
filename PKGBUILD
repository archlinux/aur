# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=5.1.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('d8774fb1e654520abdf7d790783d4a3c04fa8f4982fc1cd0d92331e7e4b5889efa022cafb5e1286b6c82a74c9388f47657c7b9d78888b5d8056fa40d3d5e5c69'
            '82b19bb3172a2f510ec56ace55c2d7e2eb0032239e2b837e0671fadfc880369eea7d6549e1de8f9844ca3a2b87c15fb83d53b22af90fd23902cb5244c6127d36')
sha256sums=('cfec5571216693537f9565073334be691717bfb762610cf1a06050e0f25aa94d'
            'fb29f8871f6049f4f84fc40971462bbba389c555a3bf19b3ad037ea0fe1d162f')
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
