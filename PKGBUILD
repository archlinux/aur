# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
_base=outdated
pkgname=python-${_base}
pkgdesc="Check if a version of a PyPI package is outdated"
pkgver=0.2.1
pkgrel=3
arch=('any')
url="https://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python-requests python-littleutils)
makedepends=(python-pip git)
source=("${_base}::git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}"
  python tests.py
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
