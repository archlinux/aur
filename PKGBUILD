# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-jupyter-extension
pkgname=python-${_base}
pkgdesc="Jupyter extension for trame client/server communication"
pkgver=2.1.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(BSD-3-Clause)
depends=(python-trame jupyterlab jupyter-server)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel npm)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('927e4fa96c201168e4ff7232c2ae5e4f7e17d4d7bbffa10a092c5d6b95e74c205779db059a5135ca3e98643b08036d11997c1934af7846f82da275398191c319')

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
