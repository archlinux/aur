# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=thumbnails-readme
pkgname=python-${_base}
pkgdesc="Create thumbnails from Git folders"
pkgver=0.2.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pdf2image python-pillow python-cairosvg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b8f4debaa12a02c3e1f99007bd2ae6cce207a1ea084d7cbfacdd973c290fb218bc617f0622f945e3366053972edb35379cd721583d6a5b259b7871929e65835b')

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
