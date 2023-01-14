# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=thumbnails-readme
pkgname=python-${_base}
pkgdesc="Create thumbnails"
pkgver=0.1.3
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pdf2image python-pillow)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7acd7f72c940da86192338d5c5f6bbbdc991b429c262727857dfa13caad2714063a9aec8a20277e3511cbb54a1eb776e4261efe1c776d9e3a9ad05165ee424e4')

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
