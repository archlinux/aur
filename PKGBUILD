# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pynacl
pkgname=($pkgbase python2-pynacl)
pkgver=1.0.1
pkgrel=2
pkgdesc='Python binding to the Networking and Cryptography (NaCl) library'
license=('Apache')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/PyNaCl'
depends=('libsodium')
makedepends=('python-setuptools' 'python-pycparser' 'python-cffi'
             'python2-setuptools' 'python2-pycparser' 'python2-cffi')
source=("https://pypi.python.org/packages/source/P/PyNaCl/PyNaCl-${pkgver}.tar.gz")
md5sums=('12fd03d8ce64e0318cb1c69272f17704')

prepare() {
	cp -a "PyNaCl-$pkgver"{,-python2}
}

build() {
	export SODIUM_INSTALL=system

	cd "$srcdir/PyNaCl-$pkgver"
	python setup.py build

	cd "$srcdir/PyNaCl-$pkgver-python2"
	python2 setup.py build
}

package_python-pynacl() {
	export SODIUM_INSTALL=system

	depends+=('python' 'python-six')

	cd "PyNaCl-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pynacl() {
	export SODIUM_INSTALL=system

	depends+=('python2' 'python2-six')

	cd "PyNaCl-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
