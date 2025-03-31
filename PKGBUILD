# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=python-quiffen
_pkgname=${pkgname#python-}
pkgver=3.0.0
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
sha256sums=('3b6bd9e706f0334e9ef8e85f87a15b047735cf89f933d6915626ad67e2e259d7')

build() {
	cd ${_pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
