# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.3.0
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('b8d0b6d6d9c5d4fc62df62d1b9b7e7006a8b430e063fe0d5f646cfaeb4c6fc9c7037b644e853b7ae7d5c5f42f079221e9cdc32564d70c9ddd6bb867ddc7056de'
            '935b381ce5a84a895fabcdfe87fbcb9c5c2f2af2a6ea12948a704447406932366261a105ce08b95dd9e4257b0f46ab98b6df4de61186c82b602dd81b334a0d4b')
sha256sums=('d4c0da5a6be9652f55bf237dd44d68602f75c617b486356cb70fc4514f2fd360'
            '14be11a9d60b06aed93f2a4cece039d78e49eb3aa4a7b92f9058b9e6e53afb8d')
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
