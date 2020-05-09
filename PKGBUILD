# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=massivethreads
pkgver=1.00
pkgrel=1
pkgdesc="A Lightweight Thread Library for High Productivity Languages"
arch=('x86_64')
url="https://github.com/massivethreads/massivethreads"
license=('BSD')
depends=('python')
makedepends=('glibc' 'gcc')
optdepends=('sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/massivethreads/massivethreads/archive/v$pkgver.tar.gz")
sha256sums=('85b83ff096e2984c725faa4814a9c5e77c143198660ec60118b897afdfd05f98')

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
