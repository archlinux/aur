# Maintainer: David McIlwraith <archaios at archaios dot net>
pkgname=libqcow
pkgver=20160108
pkgrel=1
pkgdesc="Library and tools to support QEMU copy-on-write image format (QCOW, QCOW2), including a FUSE-based mount utility"
url="https://github.com/libyal/libqcow/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fuse' 'openssl')
makedepends=('zlib' 'openssl' 'python')
source=("https://github.com/libyal/libqcow/archive/$pkgver.tar.gz")
sha256sums=('57c2b814e6b1bc957c2f1e56f126bd15bcf44c6fe1aa82227cf2cb63d68d2624')

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
