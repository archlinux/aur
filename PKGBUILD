# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual-universal-directorytree
pkgname=python-${_base}
pkgver=1.0.2
pkgrel=1
pkgdesc="textual plugin for a DirectoryTree compatible with remote filesystems"
arch=(any)
url="https://github.com/juftin/${_base}"
license=(MIT)
depends=(python-textual python-universal_pathlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('37256f3b7cf12f56c18a7e7faf21081b70d3b1ca7a3db9f15388614b1cb215e3e19a60891fecd2169b430cfdbfdca5d0010962c04dadbc3df5ba72c08314f451')

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
