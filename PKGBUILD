# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=python-quiffen
_pkgname=${pkgname#python-}
pkgver=4.0.0
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
sha256sums=('2393ce25d3f12f48e7739f719c17a8d21daa7730fde0423e767550da802fcad5')

build() {
	cd ${_pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
