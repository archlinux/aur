# Maintainer: Nick Blais <nick.blais@thinkrf.com>
pkgname=pyrf-git
pkgver=r1794.ae859eb
pkgrel=2
epoch=
pkgdesc="python API for RF receivers including ThinkRF WSA5000"
arch=('any')
url="https://github.com/pyrf/"
license=('custom')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-pyside' 'python2-pyqtgraph' 'python2-zope-interface' 'python2-twisted' 'python2-netifaces' 'python2-setuptools' 'tk' 'python2-qt4reactor')
makedepends=('git' 'python2-pip')
source=("${pkgname}::git+git://github.com/pyrf/pyrf.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/share/$pkgname/examples"
	mv "$srcdir/$pkgname/examples" "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/$pkgname/docs"
	mv "$srcdir/$pkgname/docs" "$pkgdir/usr/share/$pkgname"
}
