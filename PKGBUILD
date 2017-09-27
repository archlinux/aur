# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=zlib-static
epoch=1
pkgver=1.2.11
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')
url="http://www.zlib.net/"
depends=('glibc')
options=('staticlibs')  # needed by binutils testsuite
provides=('zlib')
conflicts=('zlib')
source=("http://zlib.net/zlib-${pkgver}.tar.gz")
md5sums=('1c9f62f0778697a09d36121ead88e08e')

prepare() {
	cd ${srcdir}/zlib-$pkgver
	grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build() {
	cd ${srcdir}/zlib-$pkgver
	CFLAGS="$CFLAGS -fPIC" ./configure --prefix=/usr
	make
}

check() {
	cd ${srcdir}/zlib-$pkgver
	make test
}

package() {
	pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP'

	cd ${srcdir}/zlib-$pkgver
	make install DESTDIR=${pkgdir}
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/zlib/LICENSE
}
