# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-pydash
pkgver=8.0.1
pkgrel=1
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
checkdepends=(python-pytest python-pytest-cov)
depends=(python python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d6062f75b6f6eecfcd5b571137babc69c4c19cb5a432c77948fe2cae188985bf')

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

