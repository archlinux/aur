# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Type annotations for SciPy"
pkgver=1.18.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/scipy/${_base}"
license=(BSD-3-Clause)
depends=(python-optype python-numpy)
makedepends=(python-build python-installer python-uv-build)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c7f35ba1ba488bd853f1a8b94cf9eac68d0e8fe1ab1620ac615c17ba97f6a7d6b8b41f2f001f1a11b9eb1de470e456d27c77621e6288ead3432b3b61fe074baa')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
