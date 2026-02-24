# Contributor: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.12
pkgrel=1
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
makedepends=('asciidoctor')
source=("$url/$pkgname-$pkgver.tar.gz" 'deheader_use-system-python.patch')
sha512sums=('d79102c1d8e4022cda1af0e5cec726391df8c901412c5df1c2c0b761098660efbf786cbaa20f865236005df5951966abd739c8feaa72fdcce9a1b04860a4c6e3'
            '39abe864f58994ba2c4bfe092ee15372a62ffc607ab06912d949b1187a11de5ade0eb121dd54a5cb9659ca4bf33bd8b3866b906d1c82f893a818e659b5f9b842')

prepare() {
	cd "$pkgname-$pkgver"
#	patch --strip=1 --input="$srcdir/deheader_use-system-python.patch"
}
build () {
	cd "$pkgname-$pkgver"
	make
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
