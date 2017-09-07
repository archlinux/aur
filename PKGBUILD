# Maintainer:	Matthias Riegler <matthias@xvzf.tech>
pkgname=zlib-aarch64
pkgver=1.2.11
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')
url="http://www.zlib.net/"
depends=('glibc' 'aarch64-linux-gnu-gcc')
options=('staticlibs')  # needed by binutils testsuite
source=("http://zlib.net/zlib-${pkgver}.tar.gz"{,.asc})
md5sums=('1c9f62f0778697a09d36121ead88e08e'
         'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')

build() {
	cd ${srcdir}/zlib-$pkgver
	export CC=aarch64-linux-gnu-gcc
	export AR=aarch64-linux-gnu-ar
	export STRIP=aarch64-linux-gnu-strip
	export CFLAGS=""

#	sed "s/\$CC /aarch64-linux-gnu-gcc /g" -i configure
	./configure --prefix=/usr/aarch64-linux-gnu
	make
}

package() {
	cd ${srcdir}/zlib-$pkgver
	make install DESTDIR=${pkgdir}
}

