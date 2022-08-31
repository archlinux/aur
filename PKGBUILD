# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
_base=outdated
pkgname=python-${_base}
pkgdesc="Check if a version of a PyPI package is outdated"
pkgver=0.2.1
pkgrel=4
arch=(any)
url="https://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python-requests python-littleutils)
makedepends=(python-setuptools-scm python-wheel git)
source=("${_base}-${pkgver}::git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python tests.py
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
