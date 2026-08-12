# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkg="isbnlib"
_name="python-${_pkg}"
pkgname="${_name}2"
pkgver=3.11.21
pkgrel=4
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=(any)
url="https://github.com/hans-fritz-pommes/isbnlib"
license=(LGPL-3.0-or-later)
provides=("${_name}")
conflicts=("${_name}")
depends=(python)
makedepends=(python-{build,installer,setuptools})
checkdepends=(python-pytest)
source=("${_pkg}-${pkgver}.tar.gz::https://github.com/hans-fritz-pommes/${_pkg}/archive/v${pkgver}.tar.gz")
sha256sums=('fc67d64fbb0f9286973429ede2f182d0781874c7dc3fb81b06872acc7a55678e')

build() {
	cd "${_pkg}-$pkgver"
	python -m build -wn
}

check() {
	cd "${_pkg}-$pkgver"
	python -m pytest -m 'not network' --override-ini="addopts="
}

package() {
	cd "${_pkg}-$pkgver"
	python -m installer -d "$pkgdir" dist/*.whl
}
