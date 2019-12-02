# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=2.4.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('43006a9f0b3acbc27fb3726536eb8723155521c3b29e187d54b350320f179454c526f5e5e66c0b3a1fca62003d1e830220d4753fd374efa3a0fa1f8a1d02e739'
            'e62656fe4e7b37f93bd5144fe54180d8e7b71e6445bee94604cfbd58730972c14388aaf26f9bf77cc4d0bd8ecd48f3d92642c6d827602c3e11c095f3308575c5')
sha256sums=('95bf33fe35a80612b800bf6db5b2164f28b6147809a2f600a504e59263ba9c84'
            '54bd3d4e2c0f84609abfbfa0be7eab7d006ea1942bf195ba4fc6da310fb9afb3')
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
