# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=2.0.1
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters"
arch=('any')
url="https://github.com/gforcada/${_base}"
license=(GPL2)
depends=(flake8)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('02dc80dabc1d20f96176f57aaa953f3d2edb637371c6c6bd10300ce2fe7aaa68fef0ff9dec664a05d0e2a7b4e86bc380b24c9967b5541d9df1de3e6fa2324f5c')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest run_tests.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
