# -*- mode: sh; -*-
# Maintainer: Jeff Mickey <jeff@archlinux.org>
pkgname=shepherd
pkgver=0.3.1
pkgrel=1
pkgdesc="Service manager that looks after the herd."
arch=('x86_64' 'i686')
url="http://gnu.org/s/shepherd"
license=('GPL3')
depends=('guile')
makedepends=('gcc' 'make' 'gawk' 'sed')
source=("http://alpha.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7accbd52132f3c0cfbc02d8e0c9e80de')

build() {
	cd "$pkgname-$pkgver"
	# We do not set sbindir here so it's easier to delete in the package step.
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# get rid of halt / reboot and the var dir
	rm -r $pkgdir/usr/var
	rm -r $pkgdir/usr/sbin
	rm -r $pkgdir/usr/share/man/man8
}
