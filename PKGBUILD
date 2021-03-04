# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.3.3
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('dfdd8023453406d9f681e04da7acaad4459e632fded0f2edb2b51607438a27074935af6db4b3580120daf56e6b52283275d0c2c809380caa164957f1901e9dde'
            'aeb0ac35e5b99f101fcf04e57659712a378c22da138ff405866baf4c41963af111b2128fc23aeb672ef0a928948ec9f4eeb9eea51781cb20a24cba7fd92af09a')
sha256sums=('b9fde063b32d4f0c3bab9d069aa8ac4d7d804ce5bebb54d7a2e574e70309bc93'
            '0fe5f256396f0e81d686a728ccf106094f577669877d05e1d82161f5de1d0ede')
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
