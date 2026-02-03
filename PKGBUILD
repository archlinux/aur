# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkg="isbnlib"
_name="python-${_pkg}"
pkgname="${_name}2"
pkgver=3.11.3
pkgrel=2
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=(any)
url="https://github.com/hans-fritz-pommes/isbnlib"
license=(LGPL-3.0-only)
provides=("${_name}")
conflicts=("${_name}")
depends=(python)
makedepends=(python-{build,installer} python-setuptools)
source=("$_pkg-$pkgver.tar.gz::https://github.com/hans-fritz-pommes/${_pkg}/archive/v$pkgver/${_pkg}-$_pkgver.tar.gz")
sha256sums=('08a8761476e7165c2e9cf72c9a797fb993c6ec457dee37226d78521db54697cd')

build() {
	cd "${_pkg}-$pkgver"
	python -m build -wn
}

check() {
	cd "${_pkg}-$pkgver"
	python -m pytest -m 'not network'
}

package() {
	cd "${_pkg}-$pkgver"
	python -m installer -d "$pkgdir" dist/*.whl
}
