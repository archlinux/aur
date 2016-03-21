# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-unpaddedbase64
pkgname=($pkgbase python2-unpaddedbase64)
pkgver=1.1.0
_commit=c804b5753f4805cf3d129fa4e7febef5c032b6ca
pkgrel=1
pkgdesc='Unpadded Base64'
license=('Apache')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/unpaddedbase64/'
makedepends=('python-setuptools' 'python2-setuptools')
#source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/python-unpaddedbase64/archive/v${pkgver}.tar.gz")
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/python-unpaddedbase64/archive/${_commit}.tar.gz")
md5sums=('3d2b2f1e1780be4c8cc30951715870e9')

prepare() {
	cp -a "python-unpaddedbase64-${_commit}"{,-python2}
}

build() {
	cd "$srcdir/python-unpaddedbase64-${_commit}"
	python setup.py build

	cd "$srcdir/python-unpaddedbase64-${_commit}-python2"
	python2 setup.py build
}

package_python-unpaddedbase64() {
	depends=('python')

	cd "python-unpaddedbase64-${_commit}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-unpaddedbase64() {
	depends=('python2')

	cd "python-unpaddedbase64-${_commit}-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
