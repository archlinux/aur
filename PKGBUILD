# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=1.5.3
pkgrel=2
pkgdesc="Check for python builtins being used as variables or parameters"
arch=('any')
url="https://github.com/gforcada/${_base}"
license=(GPL2)
depends=(flake8)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-hypothesmith)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('bfa182f7df462b960ba06d440d57960b2cbf56af85a9282b53ef3d9c29ddf5da5a96a165a1d3b08f38e25a4467ba75ea2b102c67c063c00f19120b05d38406a7')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest run_tests.py
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
