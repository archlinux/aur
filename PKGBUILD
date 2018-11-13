# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=funjoin
pkgver=1.0
pkgrel=1
pkgdesc='Split separated input into files'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(BSD)
depends=(glibc)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(80df9938f80e53566b8d5264bf5e5e83af1aa264f42431ee68e01fa81ceb95a0)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	echo one::two_three | ./funjoin _ ::
	rm xx01 xx02 xx03
}

package() {
	cd $pkgname-$pkgver
	make install prefix="$pkgdir/usr" "man1dir=$pkgdir/usr/share/man/man1"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}
