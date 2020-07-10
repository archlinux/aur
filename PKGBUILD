# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.1.3
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('fb702e45fb994d4f1be55c2b05c4c4b4c67ae838f4f46864ba944890c1810b871fbafaa323d432f0f600f8182b4370757b75de756ae2795b595776e3fe03ba7b'
            'cb6c2d0784c85483c174392ff9bfd148f2a837074d4cd44c25b17e8d0c3d78612bc00c58aea0e7b2b61239cadf68cf0ac68c698e79befc05a1a8614c71753124')
sha256sums=('5e4a2fac5ac9a49bdec7dc3fa06547fdb83629dc7b854fb0ce63d484521f9684'
            'fb63237b8aa0e7f63ce96540531ea2fda7b30250625a6d08cda597d753a3b1e7')
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
