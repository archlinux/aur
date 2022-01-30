# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.8
pkgrel=1
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
source=("$url/$pkgname-$pkgver.tar.gz" 'deheader_use-system-python.patch')
sha512sums=('b9dc32e37d1615f373b1e003aacc9479dc32bbead5bc537643cdd718b3a784aea3520399a3cabb02e53355b485ec23487b45e0a349f9004f57bb352a898989d5'
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
