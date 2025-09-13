# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=earthpy
pkgname=python-${_base}
pkgver=0.10.1
pkgrel=1
pkgdesc="Package built to support working with spatial data"
arch=(any)
url="https://github.com/earthlab/${_base}"
license=(BSD-3-Clause)
depends=(python-requests python-geopandas python-matplotlib python-rasterio python-scikit-image)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('27dbe8938683158a01708f4857e346843e7022b86bce0b40527798ad4c252fcd')

build() {
	cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
# 	cd ${_base}-${pkgver}
# }

package() {
	cd ${_base}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
