# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jean Lucas <jean@4ray.co>
_base=datatile
pkgname=python-${_base}
pkgver=0.2.0
pkgrel=1
pkgdesc="A library for managing, validating, summarizing, and visualizing data"
arch=('x86_64')
url="https://github.com/polyaxon/${_base}"
license=('Apache-2.0')
depends=(python-pandas)
# makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c957e6e6e515c79d4e687ad4accba098bb1b552e47ba263f66251e8fc4e2883cc4cbfe22e75e9bae23473edfedd1af12a9d2b7cd411daee923d16d8ae4c3369d')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
