# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: getzze <getzze [at] @gmail [dot] com>
# Contributor: Maziar Saleh Ziabari <helasraizam@gmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_core
pkgver=0.4.2
pkgrel=1
pkgdesc="Common utilities for jupyter-contrib projects"
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD-3-Clause)
depends=(jupyter-notebook python-setuptools python-traitlets python-tornado)
makedepends=(python-build python-installer python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7055049e1aa5a37cacb57ed6cfbafa971f61e52fdd701864c56653482840ee691a9652b809520b47daa079d886c5c7ad8f435b35629790599e234258f2c023e8')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
