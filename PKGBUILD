# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.1.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('1f770edf619ade8780d0a494934071bfa82d1298043459cab6e3db6a5617e6aad0d7193635c868ef0d0312b808027ad3734cb92b0c8eff826cd5a860eb3fe6d2'
            'ee6f0d7e3b2120b59373b2d35316da43350c397e7005efa90da181805307d475057ea846f76a2751e57803918381dee08e5e3e1c12df66daedc83ba72b90bcf5')
sha256sums=('7401c68baef31622251eac47cabe0e35c973baec6b938b20741f777cf58d2dce'
            '0067d965d94ff87f8f9cbf8a95ae76f72b72f60607231b4437313e4ae435d13a')
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
