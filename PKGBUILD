# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.10
pkgrel=1
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
source=("$url/$pkgname-$pkgver.tar.gz" 'deheader_use-system-python.patch')
sha512sums=('fb864d7f11e448cac1de57bcf8fe611c7567083e33400be6e9f9f53345b90957772b36fd9ae6ed837984a75dbdd7271ccdeb6f7a4b30e6ddf45fe4d157df5019'
            '39abe864f58994ba2c4bfe092ee15372a62ffc607ab06912d949b1187a11de5ade0eb121dd54a5cb9659ca4bf33bd8b3866b906d1c82f893a818e659b5f9b842')

prepare() {
	cd "$pkgname-$pkgver"
	patch --strip=1 --input="$srcdir/deheader_use-system-python.patch"
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 deheader -t "$pkgdir/usr/bin"
	install -Dm644 deheader.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
