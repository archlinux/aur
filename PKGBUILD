_base=jupyterlab-fonts
pkgname=python-${_base}
pkgdesc="Data-driven Style and Typography for JupyterLab powered by JSS."
pkgver=3.0.0
pkgrel=2
arch=(any)
url="https://github.com/deathbeds/${_base}"
license=(BSD3)
depends=(jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder npm python-flit-core)
source=(jupyterlab_fonts-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jupyterlab_fonts-${pkgver}.tar.gz)
sha256sums=('9f98258fb80c5fe86e4996e7cbf1089c0837ffe19c49afd5f929f0762dfaf961')

build() {
  cd jupyterlab_fonts-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd jupyterlab_fonts-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
