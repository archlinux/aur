# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.27.1
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="https://github.com/scikit-rf/scikit-rf"
license=("BSD")
depends=(
	"python"
	"python-matplotlib"
	"python-nbsphinx"
	"python-networkx"
	"python-numpy"
	"python-openpyxl"
	"python-pandas"
	"python-scipy"
	"python-xlwt"
)
makedepends=(python-build python-installer python-wheel)
optdepends=(
	"python-pyvisa: for instrument control"
	"python-vxi11: for instrument control over ethernet"
	"python-xlrd: for xls reading"
	"python-pyqt5: qtapps"
	"python-pyqt: qtapps"
	"python-pyqgraph: qtapps"
)

sha256sums=('ccb80f8bc77f0231e23559e1e5f8b1661ff7c1651450ca1fbcd1f2d378743925')
source=("${pkgname}-${pkgver}::https://github.com/scikit-rf/scikit-rf/archive/refs/tags/v${pkgver}.tar.gz")


build() {
	cd "${srcdir}/scikit-rf-${pkgver}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/scikit-rf-${pkgver}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
}
