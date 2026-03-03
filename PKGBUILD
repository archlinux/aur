# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=2.1.3
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-jupyter-core jupyter-server python-ipykernel python-platformdirs python-nodeenv nodejs)
makedepends=(python-build python-installer python-hatch-nodejs-version
  python-hatch-deps-selector python-hatch-jupyter-builder npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('273bd4554ef5f253b011afeb4498c416ebcd99f61bedde61a91b16cae75c434cd7ada5ede51e994d63006ed3acdb5a03a76a13b9d09fb7eeac3e6f659b5931ff')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
