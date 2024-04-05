# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.32.0
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

sha256sums=('b0e2ceef1b8178a0344c7967185b6a81a2ae2d0bd656ea578b0aa1fbab07b256')
source=("${pkgname}-${pkgver}::https://github.com/scikit-rf/scikit-rf/archive/refs/tags/v.${pkgver}.tar.gz")


build() {
	cd "${srcdir}/scikit-rf-v.${pkgver}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/scikit-rf-v.${pkgver}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
}
