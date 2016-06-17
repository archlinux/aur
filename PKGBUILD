# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-pymacaroons-pynacl
pkgname=($pkgbase python2-pymacaroons-pynacl)
pkgver=0.9.3
pkgrel=1
pkgdesc='Macaroon library for Python'
license=('Apache')
arch=('any')
url='https://pypi.python.org/pypi/pymacaroons-pynacl/'
makedepends=('python-setuptools' 'python2-setuptools')
source=("git://github.com/matrix-org/pymacaroons#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
	cp -a pymacaroons{,-python2}
}

build() {
	cd "$srcdir/pymacaroons"
	python setup.py build

	cd "$srcdir/pymacaroons-python2"
	python2 setup.py build
}

package_python-pymacaroons-pynacl() {
	depends+=('python' 'python-pynacl' 'python-six')

	cd pymacaroons
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pymacaroons-pynacl() {
	depends+=('python2' 'python2-pynacl' 'python2-six')

	cd pymacaroons-python2
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
