# Maintainer: UnicornDarkness

pkgname=dmg2dir
pkgver=3.1.1
pkgrel=3
pkgdesc="A Bash script which extract macOS application from DMG file"
arch=('any')
url="https://github.com/TheTumultuousUnicornOfDarkness/dmg2dir"
license=('unknow')
depends=('dmg2img' 'udisks2')
optdepends=('cdrtools: to use --iso option'
	'darling: to use --run option')
source=("$pkgname-$pkgver::https://github.com/TheTumultuousUnicornOfDarkness/$pkgname/archive/v$pkgver.tar.gz"
        "0001-makefile-remove-po.patch")
sha512sums=('b5ef6b1c5e59d84456844dd440833d84bd1a0203116a9e100e4d7a5f7f010a48fd3049a895574fbe8090f01cedfe0d71ab5bd23412ee5fb5ecdeb087f00745c5'
            '2f15c84a127673bfecefe675589cd74535bf6825b22b73b6c384020e3ca3094dc777ef5bd2cc8ee799233946f17547761011db2b26706273def125f67866044f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch --forward --strip=1 --input="$srcdir/0001-makefile-remove-po.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
