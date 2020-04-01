# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
_pkgver=2.0.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-multipledispatch' 'python-tensorflow' 'python-tensorflow-probability' 'python-tabulate')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/v${_pkgver}.tar.gz")
sha256sums=('90f1225049b57e1803e61c48442d5ae2cb13c195a8928972da020c645592fcb7')

prepare() {
    # Do not install tests into site-packages root
    find "${srcdir}/GPflow-${_pkgver}/tests/" -name "__init__.py" -type f -delete
}

build() {
  cd "${srcdir}"/GPflow-${_pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-${_pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
