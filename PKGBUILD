# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-swiglpk
pkgver=5.0.8
pkgrel=1
pkgdesc='A Python interface to the GLPK optimization solver.'
arch=('any')
url='https://github.com/biosustain/swiglpk'
license=('GPL3')
depends=('python' 'glpk')
makedepends=('swig' 'python-setuptools')
conflicts=('python-swiglpk-git')
source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")
md5sums=('4b165b315762e121f0d28803b7423106')

build() {
	cd "${srcdir}/swiglpk-${pkgver}"
	python setup.py build
}

check() {
	_arch="linux-$(uname -m)"
	_pymajver="$(python -V | awk '{print $2}' | awk -F. '{print $1$2}')"

	cd "${srcdir}/swiglpk-${pkgver}/build/lib.${_arch}-cpython-${_pymajver}"
	python -Bc "import swiglpk"
}

package() {
	cd "${srcdir}/swiglpk-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
