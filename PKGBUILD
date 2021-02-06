# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-smcp
pkgver=0.4.6
pkgrel=5
pkgdesc='A Python solver for sparse matrix cone programs.'
arch=('any')
url='https://smcp.readthedocs.io'
license=('GPL3')
depends=('python-cvxopt' 'python-chompack')
makedepends=('python-setuptools')
source=("https://github.com/cvxopt/smcp/archive/v${pkgver}.tar.gz")
md5sums=('0ebf84f5080f7e4dd80b9b9149314a71')

build() {
	cd "${srcdir}/smcp-${pkgver}"
	python setup.py build
}

check() {
	_arch="linux-$(uname -m)"
	_pymajver="$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')"

	cd "${srcdir}/smcp-${pkgver}/build/lib.${_arch}-${_pymajver}"
	python -Bc "import smcp"
}

package() {
	cd "${srcdir}/smcp-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
