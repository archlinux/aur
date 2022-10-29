# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mystic
pkgname=python-${_base}
pkgdesc="highly-constrained non-convex optimization and uncertainty quantification"
pkgver=0.4.0
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
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('3ca3fa932e0b1ba175515610f316ac0531116147531738d646a00dedd60dbb9767cc6af1873b3de86971195d82e4938a1e5ceabf67efe405ff95d4cfa243fc6b')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
