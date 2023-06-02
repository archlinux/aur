# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=tcolorpy
pkgname=python-${_base}
pkgver=0.1.3
pkgrel=1
pkgdesc="Python library to apply true color for terminal text"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('978360b224959f8d050fc889a329a191102cf42fb60c1ca298cd0ab53a6c75a4181ef7ded7282d05614cb415b56f141086e9efc6c9c32922aa9ccd3e101e9a1e')

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
