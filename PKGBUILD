# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.22.1
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli python-poetry)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4e2ad2f39839b3896254e6cc0722b7dd29236e9e1f71dafb5a810cc41a33316e6ad806d17bad767b4c537a547f78c513af640055589f19daadc1aac4212301c3')

build() {
  cd ${_base}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
