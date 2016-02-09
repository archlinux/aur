# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=invoke
pkgname=(invoke python2-invoke)
pkgver=0.12.2
pkgrel=1
pkgdesc="Task execution tool & library"
url="http://pyinvoke.org"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/i/invoke/invoke-$pkgver.tar.gz")

prepare() {
	cp -r $pkgbase-$pkgver $pkgbase-$pkgver-py2
}

build() {
	cd "$srcdir"/$pkgbase-$pkgver
	python setup.py build

	cd "$srcdir"/$pkgbase-$pkgver-py2
	python2 setup.py build
}

package_invoke() {
	depends=(python)

	cd "$srcdir"/$pkgbase-$pkgver
	rm -rf build/lib/invoke/vendor/yaml2
	python setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-invoke() {
	depends=(python2)

	cd "$srcdir"/$pkgbase-$pkgver-py2
	rm -rf build/lib/invoke/vendor/yaml3
	python2 setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$pkgdir"/usr/bin
	mv inv inv2
	mv invoke invoke2
}

sha256sums=('8001f79e80998e33a429a9a26c149db8f315676b5de782eacd980eacd0f420c0')
