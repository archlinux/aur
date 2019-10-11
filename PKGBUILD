# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.6
pkgrel=2
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
source=("$url/$pkgname-$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('8278d845bf618aabe1fb1da77fb99f6de5efe76a8bd8ae12da0327c0e4df184b7c4d50b2ac2be4a3dd271b8b010818fef83cd80d81f2be2b04bd09e2fee1cea3')

prepare() {
	# Invalid hardlink in release tarball leads to bsdtar errors during extraction
	bsdtar --extract -s '|deheader-1.6/deheader.1||R' --file "$pkgname-$pkgver.tar.gz"
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
