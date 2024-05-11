# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_base=behave
pkgname=python-${_base}
pkgver=1.2.7.dev5
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-cucumber-tag-expressions python-parse-type python-colorama)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest-html python-path python-pyhamcrest python-mock python-assertpy)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3f810ea21a86cebff4667ebc4f875147e62ebd8a4d5b48d9e9faa31fbfec5168254e44a9b02cdb7a31ebdd1295e5dcb6f7d9370ba1f052692bcbfac82b89c22f')

build() {
  cd ${_base}-${pkgver}
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
