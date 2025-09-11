# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=PyMsgBox
pkgname=python-${_base,,}
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes"
arch=(any)
url="https://github.com/asweigart/${_base}"
license=(GPL-3.0-or-later)
depends=(python tk)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pyautogui)
source=(https://pypi.org/packages/source/p/${_base,,}/${_base,,}-${pkgver}.tar.gz)
sha512sums=('fe6febafaca228895fc99ecdaf813f966eb20d4435ceb1566b380ff23a7968a3da8c38524cf16248313e3030e7a399090f9f26ced9cf350b8798139822963819')

build() {
  cd ${_base,,}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base,,}-${pkgver}
#   PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}" python tests/test_pymsgbox.py
# }

package() {
  cd ${_base,,}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
