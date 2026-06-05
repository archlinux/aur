# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Leon <aur@adigitoleo.dissimulo.com>
_base=bytecode
pkgname=python-${_base}
pkgver=0.18.1
pkgrel=1
pkgdesc="Python module to generate and modify bytecode"
arch=(any)
url="https://github.com/MatthieuDartiailh/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('eff7209327814053b4b1ecb9fb0fcaa7a091f6d91325d7cdbc5136a268ab007d4ea131532860ee23c88a19cfcc41aa048156b4602c7f8d839228b79d78a7b5d8')

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
