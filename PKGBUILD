# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchquad
pkgname=python-${_base}
pkgdesc="Package providing torch-based numerical integration methods"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/esa/${_base}"
license=(GPL-3.0-or-later)
depends=(python-loguru python-matplotlib python-scipy python-tqdm python-autoray)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ad3b8b049a1c9ae09554e2dc90a2ff395dbc29c50c90ee9c8faebad6e587799b931858039136941ad6a377f1aa3531d943a4419db3cb0e5ea5fc2b846329f9dc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
