# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: getzze <getzze [at] @gmail [dot] com>
# Contributor: Maziar Saleh Ziabari <helasraizam@gmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_nbextensions
pkgver=0.7.0
pkgrel=2
pkgdesc="A collection of Jupyter nbextensions"
arch=(any)
url="https://github.com/ipython-contrib/${pkgname}"
license=(BSD-3-Clause)
depends=(python-ipython-genutils jupyter_highlight_selected_word jupyter_nbextensions_configurator python-lxml)
makedepends=(python-build python-installer python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  ${pkgname}.install)
sha512sums=('47968f135888d4362c8b051f5c3e7d5a59d5fa725b177c6deb958cff6efc0a1d04293518bcb58b2ef36685e796f61c2ab04f290493249f147073ee789ba063f1'
  '4ad3478d015a52ca67cf52aace9bc1e6fd0bfc3c051568a9551ad4020182e08fb9907a9280e2152338f3ea075c8028a555bc20aa29c60737db66a585206d70a2')
install=${pkgname}.install

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}