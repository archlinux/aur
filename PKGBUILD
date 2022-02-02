# Contributor: Peter Mattern <pmattern at arcor dot de>
_base=pyjwkest
pkgname=python-${_base}
pkgver=1.4.0
pkgrel=4
pkgdesc="Implementation of JWT, JWS, JWE and JWK"
arch=(any)
url="https://github.com/rohe/${_base}"
license=('Apache')
depends=(python-pycryptodomex python-requests python-six python-future)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5c239c3c2347a13e5455e2375938a8e2b4c960ed62475929ddb710164acce0defe79b322b2e884a7324237e6fd07d6503f790aed8ca50f07b70689aa6b525bbf')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
