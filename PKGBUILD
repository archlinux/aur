# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.7.8
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-dill: for serialization support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('14c165b5626ea0bc16b5bf994dd35b3cd362ebb3fa45ae1932f7057a2485b2263a64eb13450ca909f44f814c105f907b88b5c2b33b4eabdea8277fdfa0fe6504')

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
