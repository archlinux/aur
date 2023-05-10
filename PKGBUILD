# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treestamps
pkgname=python-${_base}
pkgver=0.4.2
pkgrel=1
pkgdesc="Create timestamp records for recursive operations on directory trees"
url="https://github.com/ajslater/${_base}"
depends=(python-ruamel-yaml python-termcolor)
makedepends=(python-build python-installer python-poetry-core)
license=(GPL3)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('25732f0cffc551a774f53a2e7cd211591ed86e5c955a05cb5c95a39a66c268403af8e3f7c782a18f6e29762797e7b50968422c886c24375a3fd65b72924019b8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python tests/unit/*.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
