# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-unpaddedbase64
pkgname=($pkgbase python2-unpaddedbase64)
pkgver=1.1.0
pkgrel=1
pkgdesc='Unpadded Base64'
license=('Apache')
arch=('any')
url='https://pypi.python.org/pypi/unpaddedbase64/'
makedepends=('python-setuptools'
             'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/python-unpaddedbase64/archive/v${pkgver}.tar.gz")
md5sums=('e765e946f15e84eeb0dc512259a7d15b')

prepare() {
	cp -a "python-unpaddedbase64-${pkgver}"{,-python2}
}

build() {
	cd "$srcdir/python-unpaddedbase64-${pkgver}"
	python setup.py build

	cd "$srcdir/python-unpaddedbase64-${pkgver}-python2"
	python2 setup.py build
}

package_python-unpaddedbase64() {
	depends=('python')

	cd "python-unpaddedbase64-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-unpaddedbase64() {
	depends=('python2')

	cd "python-unpaddedbase64-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
