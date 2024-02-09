# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-pydash
pkgver=7.0.7
pkgrel=1
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
checkdepends=(python-pytest python-pytest-cov)
depends=(python python-typing-extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ef09b336d2e48fa338326fd1a4a1977fa9ca85105b46b6285ce57c351a738f66')

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

