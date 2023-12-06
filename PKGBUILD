# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=thumbnails-readme
pkgname=python-${_base}
pkgdesc="Create thumbnails from Git folders"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pdf2image python-pillow python-cairosvg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b5d8042a154ae4182768f1aa634e295d7fa2ddd82ceab50a02fc38c71fd344f1a1012623923f79936b53038079bf316dbb8e63c79667a29e94bccd9200410087')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
