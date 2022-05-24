# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mystic
pkgname=python-${_base}
pkgdesc="highly-constrained non-convex optimization and uncertainty quantification"
pkgver=0.3.9
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-sympy python-klepto)
makedepends=(python-setuptools)
optdepends=('python-scipy: for SciPy optimization'
  'python-pathos: for for parallel computing'
  'python-pyina: for for parallel computing'
  'python-matplotlib: for Matplotlib rendering')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('3ffc9845b88e8b8726220b2064c738634acd6562d28c906798b37d47ac788b5a0cfcec504818b1319b25d5127818421a4bda3c7728173cfdae8538b73e4f26db')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
