# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgdesc="Bidirectional communication for the PyViz ecosystem"
pkgver=3.0.0
pkgrel=1
arch=(any)
url="https://github.com/pyviz/${_base}"
license=('custom:BSD-3-clause')
depends=(python-param jupyterlab)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4c17e05efb7680e5f4d2d1430b4d1a1834c19f29affe029e25c0cb3891bc94b177b1437625626d577cee893b62e95b885700b7645b7e44d01348e28f4a871ed5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
