# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=FireflyAlgorithm
pkgname=python-${_base,,}
pkgdesc="Implementation of Firefly Algorithm in Python"
pkgver=0.3.4
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fde6105769c0816ebda270ca0ec5c85c997e0ca895329b6515c6a229b9da240ef5732faa236a78b20a5e5dc59ac8a325780bf5bd4d58de8b52a8ce960d2653b7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not overpy_node_manipulation'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
