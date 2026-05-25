# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Adelmo Junior <noblehelm@gmail.com>
_base=scikit-fuzzy
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=1
pkgdesc="Fuzzy logic toolkit for SciPy"
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
makedepends=(python-build python-installer python-setuptools)
depends=(python-networkx)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0b4756b7657309a6bef5114c43750c67ff2f8c64000ef9c607400714ce17ce543283a62f843d4d07e1ec554c7f7e9c158feb9ea276c8842c3081a675e1643caf')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package_python-scikit-fuzzy() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}