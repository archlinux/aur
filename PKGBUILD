# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-pydash
pkgver=7.0.6
pkgrel=2
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
checkdepends=(python-pytest)
depends=(python python-typing-extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f60e43ff71f0031650e603b5e754ebe78b9cdb333f3a0397ce78627dbf099371')

build() {
  cd "pydash-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pydash-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644  LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}

check() {
  cd "pydash-${pkgver}"
  PYTHONPATH=src pytest -k 'not test_unique_id' tests --ignore tests/pytest_mypy_testing
}

