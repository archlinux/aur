# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=python-${_base}-commons
pkgver=2.13.5
pkgrel=1
pkgdesc="Common module for integrate allure with python-based frameworks"
arch=(any)
url="https://github.com/${_base}-framework/${_base}-python"
license=(Apache-2.0)
depends=(python-attrs python-pluggy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('92b0ac0690c4238fd0e441ec2b38de81376af404e75f4f6ca6d18d10561dfe742218455a5faf3efe6e526d9776f1060d2c9b52ac076e6ea1da88f3203e2f66b3')

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
