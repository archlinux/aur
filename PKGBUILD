# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pycryptodomex
pkgname=($pkgbase python2-pycryptodomex)
pkgver=3.4.3
pkgrel=1
pkgdesc='Cryptographic library for Python / a self-contained Python package of low-level cryptographic primitives'
license=('BSD')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pycryptodomex'
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/bf/73/7c7e75e640acce1428d1cd7ce596fb855bd9ab8df9d1be587a9b4172046a/pycryptodomex-${pkgver}.tar.gz")
md5sums=('5493d3b327504ee4967c756cff3744a8')

prepare() {
	cp -a "pycryptodomex-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/pycryptodomex-$pkgver"
	python setup.py build

	cd "$srcdir/pycryptodomex-$pkgver-python2"
	python2 setup.py build
}

package_python-pycryptodomex() {
	depends+=('python')

	cd "pycryptodomex-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

package_python2-pycryptodomex() {
	depends+=('python2')

	cd "pycryptodomex-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
