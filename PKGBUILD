# Maintainer: Anthony Wang <ta180m@pm.me>
_base=jupyterlab-latex
pkgname=python-${_base}
pkgver=4.0.0
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
arch=(any)
url="https://github.com/jupyterlab/${_base}"
license=(BSD-3-Clause)
depends=(jupyterlab jupyter-server)
makedepends=(python-build python-installer python-setuptools python-jupyter-packaging npm python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e8a3d616d5d141aadb85c54e08d4d16a0431eff61f1ace829f497b17f532841df1f4026f5b08693535492c4691f78ff217b343e45e7c8ef257d81bd1474a6bf6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
