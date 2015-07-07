# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>
pkgname=winpdb
pkgver=1.4.8
pkgrel=4
pkgdesc="A platform independent Python debugger"
arch=('any')
url="http://www.winpdb.org/"
license=('GPL')
depends=('wxpython')
source=(http://winpdb.googlecode.com/files/$pkgname-$pkgver.tar.gz
        winpdb.desktop)
md5sums=('e28049cc93c1614b9db20960d76b7ea3'
         '07bbfecd2587df6e5d2471c0955e5834')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	python2 setup.py install -f --root="$pkgdir"/ --optimize=1

	sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "$pkgdir"/usr/bin/rpdb2
	sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "$pkgdir"/usr/bin/winpdb
	sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "$pkgdir"/usr/lib/python2.7/site-packages/rpdb2.py
	sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "$pkgdir"/usr/lib/python2.7/site-packages/winpdb.py

	install -D -m644 artwork/winpdb-icon-16.png "$pkgdir"/usr/share/icons/winpdb-icon-16.png
	install -D -m644 artwork/winpdb-icon-32.png "$pkgdir"/usr/share/icons/winpdb-icon-32.png
	install -D -m644 artwork/winpdb-icon-64.png "$pkgdir"/usr/share/icons/winpdb-icon-64.png

	install -D -m644 "$srcdir"/winpdb.desktop "$pkgdir"/usr/share/applications/winpdb.desktop
}

