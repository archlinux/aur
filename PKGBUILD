# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=python-quiffen
_pkgname=${pkgname#python-}
pkgver=2.0.13
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
	python-wheel
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6db15210c7f2179e901c83715183ce3b31cf80ad0262bdc6742d5341989d384e')

prepare() {
	cd ${_pkgname}-${pkgver}
	sed -i '/pydantic =/d' pyproject.toml
	sed -i '/pandas =/d' pyproject.toml
}

build() {
	cd ${_pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
