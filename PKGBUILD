# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rich Li <rich@dranek.com>
_base=cmocean
pkgname=python-${_base}
pkgver=2.0
pkgrel=2
pkgdesc="Colormap setup for standardizing commonly-plotting oceanographic variables"
url="https://github.com/matplotlib/${_base}"
depends=(python-matplotlib)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
license=(MIT)
arch=('any')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('e9b26a42581575d657275fefe060bbacf598b6b0ef18ef463e7bde2234777e95d27d7e1d8dd590e7df7d771afeeea8ae37c3386a0db61afcbaa458e5a82d52f2')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
