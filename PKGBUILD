# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_base=behave
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-cucumber-tag-expressions python-parse-type python-colorama)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest-html python-path python-pyhamcrest python-mock python-assertpy)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('8ef01b66f491aa69677da93bef41057ec47f40ff9661b9c8f3896c167cc9d2c0c6facc8af11bf2a0fc2e2963d047a164b0d9b6539824e330efca95f5d2c63fef')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
