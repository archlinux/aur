# Maintainer: Arturo Penen <apenen@gmail.com>
_base=elasticsearch
pkgname=python-${_base}7
pkgver=7.17.12
pkgrel=1
pkgdesc="Python client for Elasticsearch 7"
arch=(any)
url="https://github.com/elastic/${_base}-py"
license=(Apache-2.0)
depends=(python-dateparser)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-sphinx_rtd_theme
conflicts=('elasticsearch')
source=(${_base}-py-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('91d44594e13932f7ccfc5e2b2b89e44e52f72bd0d72559a14ed3b3abdb26c10a3a9f41d059affad1a1bfcb0af932a5fabd0e35e284c19c9a93963107b6dde005')

build() {
  cd ${_base}-py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

