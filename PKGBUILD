# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jesse R Codling <codling@umich.edu>
_base=jupyterlab-vim
pkgname=python-${_base}
pkgdesc="Code cell vim bindings for JupyterLab and Jupyter-Server"
pkgver=4.1.4
pkgrel=2
arch=(any)
url="https://github.com/jupyterlab-contrib/${_base}"
license=(MIT)
depends=(jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4a2cc813ae1e05257fc1c9bb186d6cbc70eead5cd2d7515b5f6c80cfa2d6d4298c327a1576eea8871a50a43060f3f359597d3ac91178dbd58ee4fd7624d4253e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
