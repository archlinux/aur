# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
pkgver=4.1.0
pkgrel=1
arch=('any')
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy python-pytest)
makedepends=(python-setuptools pybind11)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('43bb22a03023a3be101bec88f13528095847fdc4a1b8b669ff9583de2184982673c63ef869bded3599f2aa81d8746914cc01ddff9c7307c5598d0e17da5e9000')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py test
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
