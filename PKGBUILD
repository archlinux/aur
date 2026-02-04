# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treestamps
pkgname=python-${_base}
pkgver=2.3.0
pkgrel=1
pkgdesc="Create timestamp records for recursive operations on directory trees"
url="https://github.com/ajslater/${_base}"
depends=(python-ruamel-yaml python-termcolor)
makedepends=(python-build python-installer python-uv-build)
license=(GPL-3.0-or-later)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5be664fb20869ce3d56b74827b183bb8a4bce4fa3e4330f4a50f3e0959d2a566ce723e4d80414f901b541c1fc9735f08d9bee9cf7253c3015915b69fc326ea6f')

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
