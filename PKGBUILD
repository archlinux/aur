# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: taotieren <admin@taotieren.com>

pkgname=python-tl2cgen
_pkgname=${pkgname#*-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal model exchange and serialization format for decision tree forests"
arch=($CARCH)
url="https://github.com/dmlc/${_pkgname}"
license=('Apache-2.0')
groups=()
replaces=()
depends=(
	treelite
	fmt
	python
	python-treelite
	python-numpy
	python-scipy
	python-packaging
)
makedepends=(
	cmake
	ninja
	
	git

	python-hatchling
	python-build
	python-installer
	python-wheel
	rapidjson


)
checkdepends=()
optdepends=(
	python-scikit-learn
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e7e29be473b9af6c6a606d537b2f7349767a465eaa86d5ee511b5b540b54322a')
options=()

prepare() {
	cd "${_pkgname}-${pkgver}"
	cmake -S . -B build -G Ninja
}

build() {
	cd "${_pkgname}-${pkgver}"
	ninja -C build

	cd "./python"
	python -m build --wheel --no-isolation --outdir ../dist
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
