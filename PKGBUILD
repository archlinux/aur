# Maintainer: David Couzelis <drcouzelis@gmail.com>
pkgname=wmnetload
pkgver=1.3
pkgrel=3
pkgdesc="Dockapp which displays network activity in different LCD styles"
arch=(i686 x86_64)
url="http://dockapps.windowmaker.org/file.php/id/78"
license=('GPL')
depends=('libdockapp')
source=(http://ftp.de.debian.org/debian/pool/main/w/wmnetload/wmnetload_1.3.orig.tar.gz \
        http://tnemeth.free.fr/projets/programmes/wmnetload-1.3-tn1.patch \
        http://tnemeth.free.fr/projets/programmes/wmnetload-1.3-tn2.patch)
md5sums=('104f594c8b30d3a0895c03679e759997'
         '1ba977d044d035d9ae088f72380af1e0'
         '9703e76da9777cb60d3358e5761f0841')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-tn1.patch"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-tn2.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make LDFLAGS= RPATH=
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
