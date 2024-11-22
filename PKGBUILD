# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=massivethreads
pkgver=1.02
pkgrel=1
pkgdesc="A Lightweight Thread Library for High Productivity Languages"
arch=('x86_64')
url="https://github.com/massivethreads/massivethreads"
license=('BSD-2-Clause')
depends=('python')
makedepends=('glibc' 'gcc')
optdepends=('sqlite')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/massivethreads/massivethreads/archive/v$pkgver.tar.gz")
sha256sums=('b2f6320f51cbfbc051226a61baf9323c016c28f033283e269007493afab0123c')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname-$pkgver/tests
	make build
    make check
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install

    install -dm 755 $pkgdir/usr/share/licenses/$pkgname
    install COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
