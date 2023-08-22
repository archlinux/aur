# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=thumbnails-readme
pkgname=python-${_base}
pkgdesc="Create thumbnails from Git folders"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pdf2image python-pillow python-cairosvg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fc7ad5b9df418b1b4b02ce5aa434e8432bde687a629d172f3b3805dafd399f56a35750adee6a0a259ec5a0f38a0ae0f482cab394cf6ef308e798c7e61f5a6699')

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
