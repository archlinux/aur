# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_base=behave
pkgname=python-${_base}
pkgver=1.2.7.dev8
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-cucumber-tag-expressions python-parse-type python-colorama)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest-html python-path python-pyhamcrest python-mock python-assertpy)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d191a110a28960a4a23c94dcb4326c6bc1c3b53029e5cd54f0435dfa9c0f82b4c85e827e91344a529df7a5dd45a4736862b25c5f93996bff07937a8bd0af9979')

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
