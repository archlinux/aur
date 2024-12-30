# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=tcolorpy
pkgname=python-${_base}
pkgver=0.1.7
pkgrel=1
pkgdesc="Python library to apply true color for terminal text"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2c88e5d5bdf3971fff329c6da52c3577da09c87e46a27c0379974a88457ccbdb4ac73e44caa3076db36b016a454901b6f9601340b12410a08379ee5ef2749724')

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
