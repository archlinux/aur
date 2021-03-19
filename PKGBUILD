# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.3.4
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('212b36a3fafbda28c6416d29e2d9e49272c42d95dcdc3bbbb3691e4686ca3f0a9fec883a099d059c5bd21a9b08bf5b2eff01169de20df9777c2fce66a8cda783'
            '40425b7ead268b118c5ce85333c093696b843dce171bb98cef267044aae9d565d2a66cff91f66d10e4ead9b92482316e1bbac5824fe7c4a0ed7d877c07cc00ec')
sha256sums=('268dad63e5df73520ff03e54d445bcf4d5c46c4f77a01c3009df57b3e5bb4fa4'
            '29d06c17f6d403d074ae5a658f11dbade8a05653ea876b9f617fde17393d652c')
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
