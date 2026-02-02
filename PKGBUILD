# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pylustrator
pkgname=python-${_base}
pkgdesc="Adds interactivity to arrange panels in matplotlib"
pkgver=1.3.0
pkgrel=1
arch=(any)
url="https://github.com/rgerum/${_base}"
license=(GPL-3.0-or-later)
depends=(python-natsort python-matplotlib python-pyqt5 python-qtawesome python-scikit-image python-qtpy)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('92966cc22bd87ae9df13b9a8dd068b6059c395b9b28715fd473cf5a6a7405fbbc9f6bc181600b0cbacb1b81605027ba10e9830e12efdf7326825f35e14027da8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
