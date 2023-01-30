# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tensortrax
pkgname=python-${_base}
pkgdesc="Math on (Hyper-Dual) Tensors with Trailing Axes"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5acf99d8c3ab3c118a82daaea4bd9a5599854aed0a529c7c1c8c698561b7e84f36edbbcbabfe183bd268521ca18647aac6497c79b77ef95bbdd9cce7f8614014')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
