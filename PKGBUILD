# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-daemonize
pkgname=($pkgbase python2-daemonize)
pkgver=2.3.1
pkgrel=1
pkgdesc='Library to enable your code run as a daemon process on Unix-like systems'
license=('MIT')
arch=('any')
url='https://pypi.python.org/pypi/daemonize/'
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/d/daemonize/daemonize-${pkgver}.tar.gz")
md5sums=('f0d401a0a501ba9d36e516ea89146eb2')

prepare() {
	cp -a "daemonize-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/daemonize-$pkgver"
	python setup.py build

	cd "$srcdir/daemonize-$pkgver-python2"
	python2 setup.py build
}

package_python-daemonize() {
	depends=('python')

	cd "daemonize-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-daemonize() {
	depends=('python2')

	cd "daemonize-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
