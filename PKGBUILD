# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=tcolorpy
pkgname=python-${_base}
pkgver=0.1.4
pkgrel=1
pkgdesc="Python library to apply true color for terminal text"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4be98b0819c6eca0af55170e473e26b90d0c62b81c00fb1fe66b197f1fd6e7aec38cdd2b24dcc1b059af0ed1a54cfdc0900fad2e9145bf49b578d90edc65e74c')

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
