# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: getzze <getzze [at] @gmail [dot] com>
# Contributor: Maziar Saleh Ziabari
# Contributor: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_nbextensions_configurator
pkgver=0.6.4
pkgrel=1
pkgdesc="Jupyter serverextension providing configuration interfaces for nbextensions"
arch=(any)
url="https://github.com/jupyter-contrib/${pkgname}"
license=(BSD-3-Clause)
depends=(jupyter_contrib_core python-jupyter-core jupyter-server python-yaml)
makedepends=(python-build python-installer python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('58f508f7d379343f0374ba2de79994ae3922560f6e20e258db0b18e7bdee0b4b88fe9aec06cf82d7009ff2f78dde1c1dca8ded726d82acf9e638f366fcbd4c70')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
