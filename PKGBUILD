# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_base=behave
pkgname=python-${_base}
pkgver=1.2.7.dev7
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-cucumber-tag-expressions python-parse-type python-colorama)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest-html python-path python-pyhamcrest python-mock python-assertpy)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5000c4daa10b76087770e9b1c31f5f6f49ebb90414d93223da3f1224310a06316ee61ee5a4c6514625375877d95ac5fe38a50993ef482761b49d7ee807d8fe54')

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
