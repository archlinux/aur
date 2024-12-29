# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=tcolorpy
pkgname=python-${_base}
pkgver=0.1.6
pkgrel=1
pkgdesc="Python library to apply true color for terminal text"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bf77b9fe8f61eb1e751489ed5bba22e59e2b954bf03963b50d4640680ebd37fef763804be2ef6dd202974ff37ba9e5b39074bd346a6e626aaab0e2dde9f55d40')

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
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
