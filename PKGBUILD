# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=python-${_base}-commons
pkgver=2.14.3
pkgrel=1
pkgdesc="Common module for integrate allure with python-based frameworks"
arch=(any)
url="https://github.com/${_base}-framework/${_base}-python"
license=(Apache-2.0)
depends=(python-attrs python-pluggy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7a443b4c63a67f7fac3b9173dcaa4b691e992d06bdab088f1e019c0e8cd482b5ecc9e178185ae1ad42a708cec08323da902d85a5a081efa20dbb59cea14fedb1')

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
