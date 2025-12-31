# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=python-quiffen
_pkgname=${pkgname#python-}
pkgver=4.0.1
pkgrel=1
pkgdesc='Quiffen is a Python package for parsing QIF (Quicken Interchange Format) files.'
arch=('any')
url="https://github.com/isaacharrisholt/quiffen"
license=('MIT')
depends=(
	python
	python-pydantic
	python-dateutil
)
optdepends=(
	"python-pandas: for exporting to DataFrames"
)
makedepends=(
	python-poetry-core
	python-build
	python-installer
	python-pdm-backend
	python-wheel
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6170a8bf22d19e7249d929e5b5a24b167c84e833bea8942d87edf7a5a522fb4a')

build() {
	cd ${_pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
