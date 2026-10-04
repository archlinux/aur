# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treestamps
pkgname=python-${_base}
pkgver=5.2.0
pkgrel=1
pkgdesc="Create timestamp records for recursive operations on directory trees"
url="https://github.com/ajslater/${_base}"
depends=(python-ruamel-yaml python-typing_extensions)
makedepends=(python-build python-installer python-uv-build)
license=(GPL-3.0-or-later)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('adece00fb9190189fa6d7145139915ac47f738a078b7776e5f68b3392885411cc3770d67932b6801e47f190742cf100f3f1843be4ed67a743343abf81ea3d8ea')

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
