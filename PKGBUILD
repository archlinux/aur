# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgdesc="Bidirectional communication for the PyViz ecosystem"
pkgver=3.0.6
pkgrel=1
arch=(any)
url="https://github.com/pyviz/${_base}"
license=(BSD-3-Clause)
depends=(python-param jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('d1ed9a84a71e21ff958abb4c998123b5317dae4fba54fcfec2a6702238c8130cc34f7a40bd5f3e4ad84d164d50617e380a32192c719565d00511f894c0fb1b67')

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
