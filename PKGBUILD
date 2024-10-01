# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.7.6.9
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-dill: for serialization support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d70bde1222fc5f26a6dd6b4545d6c1898f4e13c248ec4e68da55d32467ac146e4ae890eac82b820a78a607b54c13797b0f049214b3a9a27888bb58f7ce9a1448')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest ${_base}/tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
