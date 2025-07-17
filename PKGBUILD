# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=1.8.0
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
	"python-typing_extensions"
)
makedepends=(python-build python-installer python-wheel)
optdepends=(
	"python-pyvisa: for instrument control"
	"python-vxi11: for instrument control over ethernet"
	"python-xlrd: for xls reading"
)

sha256sums=('c00ba602bf45ff3b368ccbb1ca93cbf0e18d0d5dfcff2591e0efacdff6d65a43')
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
