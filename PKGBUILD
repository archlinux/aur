# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=thumbnails-readme
pkgname=python-${_base}
pkgdesc="Create thumbnails from Git folders"
pkgver=0.3.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pdf2image python-pillow python-cairosvg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('130571edf0cbefb0761e17f7d15c5b1d9137e48875058884f971b255113a0d6d87915ee989f2fec7e24b3057172d216c2e99326e84df5179b037525abc912b69')

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
