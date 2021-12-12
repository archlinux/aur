# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyrate-limiter
pkgname=python-${_base}
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorimth Family"
pkgver=2.6.0
pkgrel=1
arch=('any')
url="https://github.com/vutran1710/${_base/-/}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('920c6630e15749a1d5ad438f4f653b34d9cd0942b04e9333af991a48c25746f4b5e7cfec022838a710f73018c8eef2432b994b3c5fd88c7c164e42bb4970e80c')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
