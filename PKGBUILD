# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.6.6.4
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=('any')
license=('BSD')
depends=(python-six python-dill)
makedepends=(python-setuptools)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('766fe9e0606f998409f123497a22b12500d7662340eefb3a4825bf18e01c0bdac784f9b662764ae807f80e6b32002ea8e2af82bc9ffe713a1e620673007ef5a5')

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
