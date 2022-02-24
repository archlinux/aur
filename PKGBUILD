# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=stringly
pkgname=python-${_base}
pkgdesc="Stringly typed command line interface"
pkgver=1.0b2
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-typing_extensions)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a647b98e5131b77b00520a92e58699f996ed13ec25e5fafdbd582e6f2e9ab57399be744f46e097e18c9043dd49b71bebc7c54f72a062144065254aacccb53945')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py test
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
