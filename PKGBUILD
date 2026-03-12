# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treelog
pkgname=python-${_base}
pkgdesc="Logging framework that organizes messages in a tree structure"
pkgver=2.0
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-flit-core)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6996195e58634dccb2390860305bb719a1457f81f5e01ad1a79a8c5b38e8b20c731116d753a408035e5fee8b13098821694914f97e0a384538f1f9acfbc2561a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
