# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mystic
pkgname=python-${_base}
pkgdesc="highly-constrained non-convex optimization and uncertainty quantification"
pkgver=0.3.8
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=('any')
license=('BSD')
depends=(python-numpy python-sympy python-klepto)
makedepends=(python-setuptools)
optdepends=('python-scipy: for SciPy optimization'
  'python-matplotlib: for Matplotlib rendering')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('32d5cfb6142c102c604e4a8850a68fc13f03786052692ef6c93cec4f85e3ab680f82061f53420fbd2a4ef638a26d2a9ad1bba4690f9c127546dd27d42d2f938e')

build() {
  cd "${_base}-${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
