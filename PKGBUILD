# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=python-${_base}-commons
pkgver=2.14.2
pkgrel=1
pkgdesc="Common module for integrate allure with python-based frameworks"
arch=(any)
url="https://github.com/${_base}-framework/${_base}-python"
license=(Apache-2.0)
depends=(python-attrs python-pluggy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('692426607be44d3f6351035fe68a1b3dc0c2657032db7266a75517a8008b749f7138dfe2e3def326dc1028f80889a6ec1eef1b834de5eb18a8145133b6710ba0')

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
