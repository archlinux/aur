# Maintainer: David McIlwraith <archaios at archaios dot net>
pkgname=libqcow
pkgver=20160123
pkgrel=1
pkgdesc="Library and tools to support QEMU copy-on-write image format (QCOW, QCOW2), including a FUSE-based mount utility"
url="https://github.com/libyal/libqcow/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fuse' 'openssl')
makedepends=('zlib' 'openssl' 'python')
source=("https://github.com/libyal/libqcow/archive/$pkgver.tar.gz")
sha256sums=('1294e2e08979f388360a85ef56db5b580da75f882148f868ac7a6f87b31907ba')

build(){
	cd $srcdir/$pkgname-$pkgver
	./synclibs.sh
	./autogen.sh
	./configure --prefix=/usr --enable-python --enable-verbose-output --enable-debug-output --enable-wide-character-type
	make
}

package() {
        cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
