# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchquad
pkgname=python-${_base}
pkgdesc="Package providing torch-based numerical integration methods"
pkgver=0.7.0
pkgrel=1
arch=(any)
url="https://github.com/esa/${_base}"
license=(GPL-3.0-or-later)
depends=(python-loguru python-scipy python-autoray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('22fc04f1dff11151da18bdd22549320e28256eec001c32441a39a69e0506b55745ed9f5d0d08de85b3b923658c68685c6ff1f23f1a38b29a423c0c874b4ba74c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
