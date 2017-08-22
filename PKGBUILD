# Maintainer: Markus Otto <otto@fs.tum.de>

pkgname=php-xdiff
pkgver=2.0.1
pkgrel=0
arch=('i686' 'x86_64')
pkgdesc='A file differences/patches module for PHP'
url='https://pecl.php.net/package/xdiff'
depends=('php' 'libxdiff')
license=('PHP')
source=("https://pecl.php.net/get/xdiff-$pkgver.tgz")
sha256sums=('b4ac96c33ec28a5471b6498d18c84a6ad0fe2e4e890c93df08e34061fba7d207')

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
