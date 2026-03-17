# Contributor: Markus Otto <otto@fs.tum.de>

pkgname=php-xdiff
pkgver=2.1.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A file differences/patches module for PHP'
url='https://pecl.php.net/package/xdiff'
depends=('php' 'libxdiff')
license=('PHP')
source=("https://pecl.php.net/get/xdiff-$pkgver.tgz")
sha256sums=('c8d37e298ad317d89dd717d08093c9669fef97e511b119412ddbbe78189b6c7c')

build() {
	cd $srcdir/xdiff-$pkgver

	phpize
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/xdiff-$pkgver

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1
	make test
}

package() {
	cd $srcdir/xdiff-$pkgver

	make INSTALL_ROOT=$pkgdir install
}
