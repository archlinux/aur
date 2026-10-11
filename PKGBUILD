# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Leon <aur@adigitoleo.dissimulo.com>
_base=bytecode
pkgname=python-${_base}
pkgver=0.19.1
pkgrel=1
pkgdesc="Python module to generate and modify bytecode"
arch=(any)
url="https://github.com/MatthieuDartiailh/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('df24a20a26304472c2ca7fbd5f2c0ec952e4e2fd47c9867e763b78d0c9a9d5fac22e0174bea6887b4ab912c9e00c0c57f4d87e62948633267d54d84796a2f020')

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
