# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual-universal-directorytree
pkgname=python-${_base}
pkgver=1.0.1
pkgrel=1
pkgdesc="textual plugin for a DirectoryTree compatible with remote filesystems"
arch=(any)
url="https://github.com/juftin/${_base}"
license=(MIT)
depends=(python-textual python-universal_pathlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8c108b8d553e7a9b4582c6e4f95eeb34a353664a798c2b37e7264ba02a5b796cac530eb9c06c69948c5fcb505f65ff55dac1f36de4013790f3217dcb5dcc9cf6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -k 'not screenshots'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
