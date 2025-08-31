# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_base=behave
pkgname=python-${_base}
pkgver=1.3.2
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-cucumber-tag-expressions python-parse-type python-colorama)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest-html python-path python-pyhamcrest python-mock python-assertpy)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4bf31d48947dd3edb5d6a977717802a9918be588aa3ac966f6af4c91261baf6dac59f6c8f8258e20aa767c867e4f8e074d10ddd7a78040c7bca2114323cc2708')

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
