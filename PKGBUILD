# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Leon <aur@adigitoleo.dissimulo.com>
_base=bytecode
pkgname=python-${_base}
pkgver=0.15.1
pkgrel=1
pkgdesc="Python module to generate and modify bytecode"
arch=(any)
url="https://github.com/MatthieuDartiailh/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('52656a6b0b7f3325efc1da14ec8524faefb1c8606eb31e637f1cb11889afc9246e97652a5526ad42e9b13cabab8f9a3ad596c50ace5cb98d08b774c89e1c1c03')

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
}
