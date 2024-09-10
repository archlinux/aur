# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-jupyter-extension
pkgname=python-${_base}
pkgdesc="Jupyter extension for trame client/server communication"
pkgver=2.1.3
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(BSD-3-Clause)
depends=(python-trame jupyterlab jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel npm)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('eb55d416c683755314a34db1c844055150321cad7b6719a64e6f9cb2ecc93d4334f05cb38e7482c65eb5c2b0665b0a115498db3d1a13af0db18d3fa41f2a6a5e')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
