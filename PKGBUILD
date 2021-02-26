# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.3.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('098bcbe0abc323b295bd46bcf8af00e69898ef560108b660964fb2dfdf6d114a17f051dde0fff06f06aa97f4cee086275eb5dc937166034d795d5cb3da999fca'
            '904a47bc565218d8243920f5c3c6b8a45a9f9914766fbba63730f926e7a08c3fbc28c2adcc23a3e08a4b1939375a5d766270415675afb7f9fe7b245ae498be1c')
sha256sums=('b6328ad691c71d1ae910dc3d45fe4b35faddd15f79b07b482e21b1766c89dda4'
            '585bf520d50bd6094573aef5ba223c642f5a77e8e643e9c015ca2b111e01d4e4')
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
