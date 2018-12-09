# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=luksmeta
pkgver=9
pkgrel=2
pkgdesc='Library for storing metadata in the LUKSv1 header'
arch=('x86_64')
url='https://github.com/latchset/luksmeta'
license=('LGPL')
depends=('cryptsetup')
makedepends=('asciidoc')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2"
        'Relax-content-tests-in-test-suite.patch')
sha512sums=('eeecc3de9d621c380d29b2f2ca6ce715f09c20aac8ffc6a3d3cc7dc30c5dc46df686e61928d0accf7e7281ad9baa6ee59a0cf5b58635a311769d8e08c5cc94bd'
            '145f6ceb7bad2090067c5e994bb0f89ce6388cc3c5b3e27a48704c3ae33615a81dcf309b54aa0d0004782890f9260560a24f274d442b3a397a352f5bac5b638e')

prepare() {
	cd "$pkgname-$pkgver"
	# https://github.com/latchset/luksmeta/issues/6
	patch --strip=1 --input="$srcdir/Relax-content-tests-in-test-suite.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
