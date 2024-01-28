# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.7.6.8
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-dill: for serialization support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('8f12dfe560eebecbf2fffa6fe0a34989f626b83b8c5b6b0978ee53c0b5f3265215ce33d7c3491b94debae63c535ba39604ee82fb49cde07bed847aa121a3830d')

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
