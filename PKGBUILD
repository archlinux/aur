# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-jupyter-extension
pkgname=python-${_base}
pkgdesc="Jupyter extension for trame client/server communication"
pkgver=2.1.4
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(BSD-3-Clause)
depends=(python-trame jupyterlab jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel npm)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('ea078498c6fdc9f67cf50c5450e40432eb893837ef1054ecd903b1b7e1ec2931211b1507ce4061d4c8eac8e4fa26e9f4b2c6b5e856167c34e8b03cbbecb2bf5a')

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
