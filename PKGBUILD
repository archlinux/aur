# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Leon <aur@adigitoleo.dissimulo.com>
_base=bytecode
pkgname=python-${_base}
pkgver=0.16.1
pkgrel=1
pkgdesc="Python module to generate and modify bytecode"
arch=(any)
url="https://github.com/MatthieuDartiailh/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('781e9a65c7e17bd1aa3f8bbd6dd06960e915288cbc5b6c60869c593c0c095410994047c1a5744dc6fdb4a261ef5743b89618ff85366c9a15e1d98e142f2a99dd')

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
