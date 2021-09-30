# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=pathos
pkgname=python-${_base}
pkgdesc="parallel graph management and execution in heterogeneous computing"
pkgver=0.2.8
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=('any')
license=('BSD')
depends=(python-ppft python-pox python-multiprocess)
makedepends=(python-setuptools)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('3552e7db41ec134fdebcda0e8e483e1f06e8de18b1e31184599d44c35367baf02f04d8c4f8932820e1793eeb81c4fddab6eb2026fae0ebd932be50d708f2e214')

build() {
  cd "${_base}-${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
