# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=einsumt
pkgname=python-${_base}
pkgdesc="Multithreaded version of numpy.einsum function"
pkgver=0.9.2
pkgrel=1
arch=(any)
url="https://github.com/mrkwjc/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('868087bae6660fb7127857dba6991df883c9ec07bc667e121ae9dffb5ff8ed6d51ac00f2f41edc48e08e922880aff55076216b4b1a13d83de81ef694a673bdef')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python test_einsumt.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
