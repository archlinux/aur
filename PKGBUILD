# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=2.0.0
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters"
arch=('any')
url="https://github.com/gforcada/${_base}"
license=(GPL2)
depends=(flake8)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('310ea0c38391b139baa6328b5ef3f5f1eddf56e25e98e4a22f8b3b910ea4ed716ddc7c0a8200cf537b883a0ee8d500638d872ec28a1fc5daedcb441fb774492b')

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
