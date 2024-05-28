# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splines
pkgname=python-${_base}
pkgver=0.3.2
pkgrel=1
pkgdesc="Splines in Euclidean Space and Beyond"
arch=(any)
url="https://${_base}.readthedocs.io"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/AudioSceneDescriptionFormat/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('3434b963df0e609810875e784c17a6d07e8131e5ed8ecfd6259fab168dc79357c5bebce729d776633e91f901620eaefc7f9e45f9e9d9899a0b1279f638080088')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
