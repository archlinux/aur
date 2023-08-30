# Maintainer: raf <raf at raf dot org>
pkgname=libslack
pkgver=0.7.5
pkgrel=2
pkgdesc="A UNIX/C library of general utilities for programmers with Slack"
arch=("i686" "x86_64" "armv7h" "aarch64")
url=https://libslack.org
license=("GPL")
depends=("glibc")
makedepends=("perl" "make" "gcc")
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("10561805042cf6c28476af110b886c4b695b4f38a119390acbb63996170b1cac")

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --destdir="$pkgdir" --disable-mail-test
	make
}

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	make install
	# Rename clashing manual entries
	for entry in daemon err error list
	do
		mv "$pkgdir"/usr/share/man/man3/$entry.3.gz "$pkgdir"/usr/share/man/man3/$entry-libslack.3.gz
	done
}

