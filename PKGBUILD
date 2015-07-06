# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=pyjack
pkgver=0.5.2
pkgrel=4
pkgdesc="Jack audio client module for python"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/py-jack/"
license=('GPL')
depends=('jack' 'python2-numpy')
source=(http://downloads.sourceforge.net/py-jack/$pkgname-$pkgver.tar.gz)
md5sums=('74a08e527b567e26460e8ff74f56d658')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build

	for file in $(find ./demos -name '*.py' -print); do
		sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
	done
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=$pkgdir/usr
	
	mkdir -p $pkgdir/usr/share/doc/$pkgname/demos
	install -m644 demos/* $pkgdir/usr/share/doc/pyjack/demos
	install -D -m644 Changelog $pkgdir/usr/share/doc/$pkgname/Changelog
	install -D -m644 TODO $pkgdir/usr/share/doc/$pkgname/TODO
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
