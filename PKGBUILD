# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-pynacl
pkgname=($pkgbase python2-pynacl)
pkgver=0.3.0
pkgrel=1
pkgdesc='Python binding to the Networking and Cryptography (NaCl) library'
license=('Apache')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/frozendict/'
depends=('libsodium')
makedepends=('python-setuptools' 'python-pycparser' 'python-cffi'
             'python2-setuptools' 'python2-pycparser' 'python2-cffi')
source=("https://pypi.python.org/packages/source/P/PyNaCl/PyNaCl-${pkgver}.tar.gz")
md5sums=('04dc891f6b95e3defa8a35ade57559c9')

prepare() {
	cp -a "PyNaCl-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/PyNaCl-$pkgver"
	python setup.py build

	cd "$srcdir/PyNaCl-$pkgver-python2"
	python2 setup.py build
}

package_python-pynacl() {
	depends+=('python' 'python-six')

	cd "PyNaCl-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pynacl() {
	depends+=('python2' 'python2-six')

	cd "PyNaCl-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
