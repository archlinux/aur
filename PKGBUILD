# Maintainer: Timothy Brown <sysop@timb.us>
pkgname=adjtimex
pkgver=1.29_10
pkgrel=3
pkgdesc="Allows configuration of kernel time variables"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
 url="https://github.com/rogers0/adjtimex"
license=('GPL2')
depends=('glibc')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/rogers0/adjtimex/archive/debian/${pkgver//_/-}.tar.gz"
        Makefile.patch)
md5sums=('56e5c86c5fd5ef95d18673b2ed18e3f7'
         '49548b8d3ad85bdb8e62da2d7d61f8d9')
prepare() {
        cd "$pkgname-debian-${pkgver//_/-}"
        patch -p1 -i ../../Makefile.patch Makefile.in
}

build() {
	cd "$pkgname-debian-${pkgver//_/-}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-debian-${pkgver//_/-}"
	make prefix="$pkgdir/usr" bindir="$pkgdir/usr/bin" install
}
