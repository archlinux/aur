# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=python-${_base}-commons
pkgver=2.13.4
pkgrel=1
pkgdesc="Common module for integrate allure with python-based frameworks"
arch=(any)
url="https://github.com/${_base}-framework/${_base}-python"
license=(Apache-2.0)
depends=(python-attrs python-pluggy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0ca33832aa0f9679bd4a71d79197b4217e333d6920b4f2259679fdba57268dff38a44e379831439fd2527c243f84bee84cd4b846d9f5ead919f6094f0c2446b9')

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
