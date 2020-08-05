# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.1.5
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('34be1c186df5906ab7a966739220a20afd7e3b227a5c7ba32a77256a36e097bbcc39b99ce6d6855de3e6e2296612f8fbe63dc0983ad91d4eb4c1e630dbb587a0'
            '92d05d9d55729c3a62bb452bc389edc9a23f1bf3c2f59ef43b2a86e429777a68121bfb195ed7f59171c17fb944bda16a1848ad224b316114cf707b2dd45a71fe')
sha256sums=('0493c1eb76e94ace7a00532824121ab901ac1bd3580a340ea5de92a7d9c1a19e'
            '18450efb04ffb9111290ae65f8e899e2966cf3dd1f74292203c6f0d96a441c3c')
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
