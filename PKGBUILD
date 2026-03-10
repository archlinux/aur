# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Type annotations for SciPy"
pkgver=1.17.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/scipy/${_base}"
license=(BSD-3-Clause)
depends=(python-optype python-numpy)
makedepends=(python-build python-installer python-uv-build)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d9301f92e25038253124e4b14d449739bd25d5a59e1e147de4d250ff110d5067972619a687abecba72ab6a4f740185f13fa2fc248d15819c7befae3622205f1a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
