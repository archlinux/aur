# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=cppimport
pkgname=python-${_base}
pkgdesc="Import C++ files directly from Python!"
pkgver=22.08.02
pkgrel=1
arch=(any)
url="https://github.com/tbenthompson/${_base}"
license=('custom:BSD-3-clause')
depends=(python-mako pybind11 python-filelock)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('c267cd7d8583631858e1fcf493018385725fa7c2c1d87113e5a49a9e70cb0269')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
