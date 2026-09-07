# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkg="isbnlib"
_name="python-${_pkg}"
pkgname="${_name}2"
pkgver=3.11.22
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=(any)
url="https://github.com/hans-fritz-pommes/isbnlib"
license=(LGPL-3.0-or-later)
provides=("${_name}")
conflicts=("${_name}")
depends=(python)
makedepends=(python-{build,installer,setuptools})
checkdepends=(python-pytest)
source=("${_pkg}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("fccf8a50455e529081bbe5e8dd242822e8364fcc08b10bb7d9428a19386c804f")

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
