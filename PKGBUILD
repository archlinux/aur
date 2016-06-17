# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pysaml2
pkgname=($pkgbase python2-pysaml2)
pkgver=4.0.5
pkgrel=2
pkgdesc='Python implementation of SAML Version 2'
license=('Apache')
arch=('any')
url='https://pypi.python.org/pypi/pysaml2'
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pysaml2/pysaml2-${pkgver}.tar.gz")
md5sums=('e2b8335a7490f0ca1a1818732d6cdfb1')

prepare() {
	cp -a "pysaml2-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/pysaml2-$pkgver"
	python setup.py build

	cd "$srcdir/pysaml2-$pkgver-python2"
	python2 setup.py build
}

package_python-pysaml2() {
	depends+=('python' 'python-future'  'python-requests'  'python-zope-interface'  'python-pycryptodomex'  'python-pytz'  'python-pyopenssl'  'python-dateutil'  'python-six')

	cd "pysaml2-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pysaml2() {
	depends+=('python2' 'python2-future'  'python2-requests'  'python2-zope-interface'  'python2-pycryptodomex'  'python2-pytz'  'python2-pyopenssl'  'python2-dateutil'  'python2-six')

	cd "pysaml2-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# rename all executables
	find "$pkgdir/usr/bin" -type f -exec mv {} {}2 \;
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
