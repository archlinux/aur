# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hxl-git
pkgver=1.0.r7.g6f3218e
pkgrel=1
pkgdesc="Small, optimized terminal hex viewer"
arch=('x86_64')
url="https://github.com/sjmulder/hxl"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('hxl')
conflicts=('hxl')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
