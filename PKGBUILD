# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=python-${_base}-commons
pkgver=2.16.0
pkgrel=1
pkgdesc="Common module for integrate allure with python-based frameworks"
arch=(any)
url="https://github.com/${_base}-framework/${_base}-python"
license=(Apache-2.0)
depends=(python-attrs python-pluggy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f8f6a05f19c7b71c30c4277e716733e18fbd7ee1d74e6de78ef19f99892df972607706cb32454db09b25eb2f4509513b5ac5dbb64da5415e47cbbde4604e2856')

build() {
  cd ${_base}-python-${pkgver}/${_base}-python-commons
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-python-${pkgver}/${_base}-python-commons
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ${srcdir}/${_base}-python-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
