# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgbase=python-pymacaroons
pkgname=(python-pymacaroons python2-pymacaroons)
pkgver=0.13.0
pkgrel=1

pkgdesc='Macaroon library for Python'
url='https://pypi.python.org/pypi/pymacaroons-pynacl/'
arch=('any')
license=('Apache')

makedepends=('python'
             'python-setuptools'
			 'python-six'
			 'python-pynacl'
             'python2'
             'python2-setuptools'
			 'python2-six'
			 'python2-pynacl')

source=("https://pypi.io/packages/source/p/pymacaroons/pymacaroons-$pkgver.tar.gz")

sha256sums=('1e6bba42a5f66c245adf38a5a4006a99dcc06a0703786ea636098667d42903b8')

prepare() {
	cp -a pymacaroons-$pkgver{,-python2}
}

build() {
	cd "$srcdir"/pymacaroons-$pkgver
	python setup.py build

	cd "$srcdir"/pymacaroons-$pkgver-python2
	python2 setup.py build
}

package_python-pymacaroons() {
	depends=('python' 'python-pynacl' 'python-six')

	cd pymacaroons-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pymacaroons() {
	depends=('python2' 'python2-pynacl' 'python2-six')

	cd pymacaroons-$pkgver-python2
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
