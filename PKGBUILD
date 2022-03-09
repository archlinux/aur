# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
_base=twiggy
pkgname=python-${_base}
pkgver=0.5.1
pkgrel=1
pkgdesc="a Pythonic logger"
arch=(any)
url="https://github.com/wearpants/${_base}"
license=('custom:BSD-3-clause')
depends=(python-six)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d8cc2fe85ac6b58a451129c5bcd54f7d4b61d55833b9869b48bea1572a74f0fc73ac29370f1e3dc4fc618256fbaa681e3322a5684419504f898a20370e502314')

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
