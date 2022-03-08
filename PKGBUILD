# Contributor: Benjamin Chrétien <chretien.b@gmail.com>
_base=vprof
pkgname=python-${_base}
pkgver=0.38
pkgrel=1
pkgdesc="Visual profiler for Python"
arch=(any)
url="https://github.com/nvdv/${_base}"
license=('custom:BSD-2-clause')
depends=(python-psutil)
makedepends=(python-setuptools npm)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cbaa7a094ef43d413c4c471233d14ce9cf2bd56c8c5dc35178cf4b5313d5b7cf46cf4077293022f00e2b95a962ba123bea44453647caf6b7e527440b9906231f')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}