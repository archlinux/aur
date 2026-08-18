# Maintainer: elbachir-one <bachiralfa@gmail.com>
pkgname=loksh
pkgver=7.9
pkgrel=1
pkgdesc="A Linux port of OpenBSD's ksh"
arch=('i686' 'x86_64')
url="https://github.com/dimkr/loksh"
license=('custom:LEGAL')
depends=('libbsd')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimkr/loksh/releases/download/$pkgver/loksh-$pkgver.tar.xz")
sha256sums=('9cd50a5d5023c1886ef70dfe7334cebec4f4c6a9548f15d01a04732038e9ac0f')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir" meson install -C build

	mv "$pkgdir/usr/bin/ksh" \
		"$pkgdir/usr/bin/$pkgname"

	mv "$pkgdir/usr/share/man/man1/ksh.1" \
		"$pkgdir/usr/share/man/man1/$pkgname.1"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/share/doc/$pkgname/LEGAL" \
		"$pkgdir/usr/share/licenses/$pkgname/LEGAL"
}
