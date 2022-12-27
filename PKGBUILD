# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=2.1.0
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters"
arch=('any')
url="https://github.com/gforcada/${_base}"
license=(GPL2)
depends=(flake8)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('deaaf1aee3877223a78a8563dabaf4f7fffba16258393c81f750bd297b2e6418e39a4b7c943016b7987ec1106e9317327896634581164a0025564357bbf53ab2')

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
