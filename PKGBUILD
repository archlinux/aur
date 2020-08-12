# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.7
pkgrel=1
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
source=("$url/$pkgname-$pkgver.tar.gz" 'deheader_use-system-python.patch')
sha512sums=('611c7c71a2a5c79ca79fd0de26b53fdd10a7e4b090330c35c3f7d56737b0b3c6736a6b98ca568320a36452a157af4642912e78d02c77bd43c2ef32541f4a09ed'
            '1f4d63ec337ed2f4672124abae2637605f88e3580205b744d82d505ab0d3cfe67988eb2f5c698d2a41b908c99ce66fe7da8b965073465b80ccadc1a9b0d2a72b')

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
